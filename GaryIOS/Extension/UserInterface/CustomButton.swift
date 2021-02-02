//
//  CustomButton.swift
//  GaryIOS
//
//  Created by 정종문 on 2021/02/02.
//

import UIKit
import Foundation

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
        // Button Design
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = true
        self.tintColor = UIColor.white
        self.backgroundColor = UIColor.init(displayP3Red: 204/255, green: 102/255, blue: 240/255, alpha: 1)
        self.setTitleColor(.white, for: .normal)
        
        // Button Shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        
    }
    override var isEnabled: Bool {
        didSet {
            if !self.isEnabled {
                self.backgroundColor = UIColor.init(displayP3Red: 180/255, green: 180/255, blue: 240/255, alpha: 1)
            }
        }
    }
}
