//
//  Permission.swift
//  GaryIOS
//
//  Created by 정종문 on 2021/02/02.
//

import Photos
import AVFoundation
import Foundation

// 카메라 권한
struct CameraPermission {
    var allowed: Bool {
        get {
            switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                return true
            default:
                return false
            }
        }
    }
}
// 마이크 권한
struct AudioPermission {
    var allowed: Bool {
        get {
            var result: Bool = false
            if AVAudioSession.sharedInstance().recordPermission == .granted {
                result = true
            }
            return result
        }
    }
}
// 앨범 권한
struct PhotosPermission {
    var allowed: Bool {
        get {
            switch PHPhotoLibrary.authorizationStatus(for: .readWrite) {
            case .authorized:
                return true
            default:
                return false
            }
        }
    }
}

struct PermissionCamera {
    var getAllow: Bool {
        var result: Bool = false
        AVCaptureDevice.requestAccess(for: .video) {
            ( complete ) in
            result = complete
        }
        return result
    }
}

struct PermissionAudio {
    var getAllow: Bool {
        var result: Bool = false
        AVAudioSession.sharedInstance().requestRecordPermission() {
            ( complete ) in
            result = complete
        }
        return result
    }
}

struct PermissionPhotos {
    var getAllow: Bool {
        var result: Bool = false
        PHPhotoLibrary.requestAuthorization(for: .readWrite) {
            ( complete ) in
            if complete == .authorized {
                result = true
            }
        }
        return result
    }
}
