//
//  Filter.swift
//  GaryIOS
//
//  Created by 정종문 on 2021/02/04.
//

import UIKit
import CoreImage
import Foundation

class Filters {
    func applyFilter(_ inputImage: UIImage!, filtername: String!, value: Double) -> UIImage? {
        guard inputImage != nil else {
            print("inputImage is nil")
            return nil
        }
        
        
        guard let cgImage = inputImage.cgImage else {
            print("cgImage is nil")
            return nil
        }
 
        let ciImage = CIImage(cgImage: cgImage)
        
        guard let filter = CIFilter(name: filtername) else {
            return nil
        }
        
        filter.setValue(ciImage, forKey: kCIInputImageKey)
//        filter.setValue(value, forKey: kCIInputIntensityKey)
        
        guard let filterOutputImage = filter.outputImage else {
            return nil
        }
        
        return UIImage(ciImage: filterOutputImage)
    }
}

