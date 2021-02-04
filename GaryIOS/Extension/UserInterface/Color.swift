//
//  Color.swift
//  GaryIOS
//
//  Created by 정종문 on 2021/02/04.
//

import UIKit
import Foundation

extension UIColor {
    struct MyColor {
        static var purple: UIColor {
            return UIColor.init(displayP3Red: 204/255, green: 102/255, blue: 240/255, alpha: 1)
        }
        static var gray: UIColor {
            // 추가 필요
            return UIColor.init()
        }
    }
}
