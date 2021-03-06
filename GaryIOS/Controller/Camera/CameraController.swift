//
//  CameraController.swift
//  GaryIOS
//
//  Created by 정종문 on 2021/02/03.
//

import UIKit
import AVFoundation

class CameraController: UIViewController {
    // 캡쳐 세션 정의
    var captureSession: AVCaptureSession?
    // 캡쳐 장치 정의
    var frontCamera: AVCaptureDevice?
    var backCamera: AVCaptureDevice?
    // 장치 입력 구성
    var currentCameraPosition: CameraPosition?
    var frontCameraInput: AVCaptureDeviceInput?
    var backCameraInput: AVCaptureDeviceInput?
    // 사진 촬영 정의
    var photoOutput: AVCapturePhotoOutput?
    // 카메라 화면 보기 정의
    var previewLayer: AVCaptureVideoPreviewLayer?
    // 카메라 플래시
    var flashMode = AVCaptureDevice.FlashMode.off
    
    var photoCaptureCompletionBlock: ((UIImage?, Error?) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 카메라 코드 관리 캡슐화
    func prepare(completeHandler: @escaping (Error?) -> Void) {
        // 캡쳐 세션 생성
        func createCaptureSession() {
            self.captureSession = AVCaptureSession()
        }
        // 카메라 디바이스 탐색
        func configureCaptureDevices() throws {
            // 사용 가능한 카메라 탐색 및 연결
            let session = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .unspecified)
            
            let cameras = session.devices.compactMap { $0 }
            guard !cameras.isEmpty else {
                throw CameraControllerError.noCameraAvailable
                
            }
            
            for camera in cameras {
                if camera.position == .front {
                    self.frontCamera = camera
                }
                if camera.position == .back {
                    self.backCamera = camera
                    
                    try camera.lockForConfiguration()
                    camera.focusMode = .continuousAutoFocus
                    camera.unlockForConfiguration()
                }
            }
        }
        // 세션 존재 유무 확인(없으면 오류), 입력에 대한 기능 정의 및 추가
        func configureDeviceInputs() throws {
            guard let captureSession = self.captureSession else {
                throw CameraControllerError.captureSessionIsMissing
            }
            
            if let backCamera = self.backCamera {
                self.backCameraInput = try AVCaptureDeviceInput(device: backCamera)
                
                if captureSession.canAddInput(self.backCameraInput!) {
                    captureSession.addInput(self.backCameraInput!)
                }
                
                self.currentCameraPosition = .back
            } else if let frontCamera = self.frontCamera {
                self.frontCameraInput = try AVCaptureDeviceInput(device: frontCamera)
                
                if captureSession.canAddInput(self.frontCameraInput!) {
                    captureSession.addInput(self.frontCameraInput!)
                }
                
                self.currentCameraPosition = .front
            } else {
                throw CameraControllerError.noCameraAvailable
            }
            
        }
        // 세션 존재 유무 확인(없으면 오류), 출력에 대한 기능 정의 및 추가
        func configurePhotoOutput() throws {
            guard let captureSession = self.captureSession else {
                throw CameraControllerError.captureSessionIsMissing
            }
            
            self.photoOutput = AVCapturePhotoOutput()
            self.photoOutput!.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey : AVVideoCodecType.jpeg])], completionHandler: nil)
            
            if captureSession.canAddOutput(self.photoOutput!) {
                captureSession.addOutput(self.photoOutput!)
            }
            
            captureSession.startRunning()
        }
        
        DispatchQueue(label: "prepare").async {
            do {
                createCaptureSession()
                try configureCaptureDevices()
                try configureDeviceInputs()
                try configurePhotoOutput()
            } catch {
                DispatchQueue.main.async {
                    completeHandler(error)
                }
                return
            }
            DispatchQueue.main.async {
                completeHandler(nil)
            }
        }
    }
    // 카메라 미리보기 구현
    func displayPreview(on view: UIView) throws {
        guard let captureSession = self.captureSession, captureSession.isRunning else {
            throw CameraControllerError.captureSessionIsMissing
        }
        
        self.previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.previewLayer?.connection?.videoOrientation = .portrait
        
        view.layer.insertSublayer(self.previewLayer!, at: 0)
        
        // 프리뷰가 Margin 100만큼 내려와 있으므로 view.frame을 하게되면 프리뷰 또한 100만큼 내려감
        // 프리뷰 프레임의 시작 좌표는 추가되어지는 뷰의 기준으로 0,0에서 시작되게 만들어야함.
//        self.previewLayer?.frame = view.frame
        self.previewLayer?.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: UIScreen.main.bounds.height)
    }
    // 전면, 후면 카메라 전환 기능 구현
    func switchCameras() throws {
        guard let currentCameraPosition = currentCameraPosition, let captureSession = self.captureSession, captureSession.isRunning else {
            throw CameraControllerError.captureSessionIsMissing
        }
        captureSession.beginConfiguration()
        
        func switchToFrontCamera() throws {
            guard let backCameraInput = self.backCameraInput,
                  let frontCamera = self.frontCamera,
                  captureSession.inputs.contains(backCameraInput) else {
                throw CameraControllerError.invalidOperation
            }
            
            self.frontCameraInput = try AVCaptureDeviceInput(device: frontCamera)
            
            captureSession.removeInput(backCameraInput)
            
            if captureSession.canAddInput(self.frontCameraInput!) {
                captureSession.addInput(self.frontCameraInput!)
                self.currentCameraPosition = .front
            } else {
                throw CameraControllerError.invalidOperation
            }
        }
        func switchToBackCamera() throws {
            guard let frontCameraInput = self.frontCameraInput,
                  let backCamera = self.backCamera,
                  captureSession.inputs.contains(frontCameraInput) else {
                throw CameraControllerError.invalidOperation
            }
            
            self.backCameraInput = try AVCaptureDeviceInput(device: backCamera)
            
            captureSession.removeInput(frontCameraInput)
            
            if captureSession.canAddInput(self.backCameraInput!) {
                captureSession.addInput(self.backCameraInput!)
                self.currentCameraPosition = .back
            } else {
                throw CameraControllerError.invalidOperation
            }
        }
        
        switch currentCameraPosition {
        case .front:
            try switchToBackCamera()
        case .back:
            try switchToFrontCamera()
        }
        captureSession.commitConfiguration()
    }
    // 사진 촬영 기능 구현
    func captureImage(completion: @escaping (UIImage?, Error?) -> Void) {
        guard let captureSession = self.captureSession, captureSession.isRunning else {
            completion(nil, CameraControllerError.captureSessionIsMissing)
            return
        }
        
        let settings = AVCapturePhotoSettings()
        settings.flashMode = self.flashMode
        self.photoOutput?.capturePhoto(with: settings, delegate: self)
        self.photoCaptureCompletionBlock = completion
    }
}

extension CameraController: AVCapturePhotoCaptureDelegate {
    public func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        if let error = error {
            self.photoCaptureCompletionBlock?(nil, error)
        } else if let buffer = photoSampleBuffer, let data = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: buffer, previewPhotoSampleBuffer: nil) {
            let image = UIImage(data: data)
            self.photoCaptureCompletionBlock?(image, nil)
        } else {
            self.photoCaptureCompletionBlock?(nil, CameraControllerError.unknown)
        }
    }
}
