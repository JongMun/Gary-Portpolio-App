//
//  PermissionViewController.swift
//  GaryIOS
//
//  Created by 정종문 on 2021/02/02.
//

import UIKit
import Photos
import AVFoundation

class PermissionViewController: UIViewController {

    @IBOutlet weak var checkBoxCamera: UIImageView!
    @IBOutlet weak var checkBoxRecord: UIImageView!
    @IBOutlet weak var checkBoxPhotos: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPermission(index: .camera, self.checkBoxCamera)
        getPermission(index: .record, self.checkBoxRecord)
        getPermission(index: .photos, self.checkBoxPhotos)
    }
    
    @IBAction func completePermission(_ sender: UIButton) {
        print("Camera : \(CameraPermission().allowed)")
        print("Audio : \(AudioPermission().allowed)")
        print("Photo : \(PhotosPermission().allowed)")
        
        if CameraPermission().allowed &&
            AudioPermission().allowed &&
            PhotosPermission().allowed {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.authAlertMessage(msg: "정상적인 작동 위해서는 권한에 대한 모든 요청을 허용해야합니다.")
        }
    }
    
    func getPermission(index: PermissionIndex, _ at: UIImageView) {
        let imageName = "pencil.circle.fill"
        switch index {
        case .camera:
            AVCaptureDevice.requestAccess(for: .video) {
                ( complete ) in
                if complete {
                    DispatchQueue.main.async {
                        at.image = UIImage(systemName: imageName)
                    }
                }
            }
            break;
        case .record:
            AVAudioSession.sharedInstance().requestRecordPermission() {
                ( complete ) in
                if complete {
                    DispatchQueue.main.async {
                        at.image = UIImage(systemName: imageName)
                    }
                }
            }
            break;
        case .photos:
            PHPhotoLibrary.requestAuthorization(for: .readWrite) {
                ( complete ) in
                if complete == .authorized {
                    DispatchQueue.main.async {
                        at.image = UIImage(systemName: imageName)
                    }
                }
            }
            break;
        @unknown default:
            print("Wrong Permission Index")
            break;
        }
    }
    
    func authAlertMessage(msg: String) {
        let alert = UIAlertController(title: "권한요청", message: msg, preferredStyle: UIAlertController.Style.alert)
        let allowAction = UIAlertAction(title: "이동", style: UIAlertAction.Style.default) {
            ( action ) in
            // 휴대폰 권한 설정으로 이동.
            if let settings = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settings, options: [:], completionHandler: nil)
            }
        }
        let deniedAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.default) {
            ( action ) in
            // 앱 종료하기
            UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
        }
        
        alert.addAction(allowAction)
        alert.addAction(deniedAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}

enum PermissionIndex {
    case camera
    case record
    case photos
}
