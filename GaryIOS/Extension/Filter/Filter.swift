//
//  Filter.swift
//  GaryIOS
//
//  Created by 정종문 on 2021/02/04.
//

import CoreImage
import Foundation

class Filters {
    func applyFilter(_ inputImage: CIImage, filtername: String, value: Double) -> CIImage? {
        if let filter = CIFilter(name: filtername) {
            filter.setValue(inputImage, forKey: kCIInputImageKey)
            filter.setValue(value, forKey: kCIInputIntensityKey)
            return filter.outputImage
        } else {
            print("The Filter Name doesn't Exist.")
            return nil
        }
    }
}

