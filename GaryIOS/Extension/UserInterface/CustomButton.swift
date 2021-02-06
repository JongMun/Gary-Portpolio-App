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
    required init(coder: NSCoder)
    {
        super.init(coder: coder)!
        // Button Design
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = true
        self.tintColor = UIColor.white
        self.backgroundColor = UIColor.MyColor.purple
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

class CustomCameraShutterButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonSetup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)!
        buttonSetup()
    }
    func buttonSetup() {
        let size:CGFloat = 80
        
        // Button Design
        self.setTitle("", for: .normal)
        self.layer.cornerRadius = size/2
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.MyColor.purple.cgColor
        self.layer.borderWidth = 2
        self.widthAnchor.constraint(equalToConstant: size).isActive = true
        self.heightAnchor.constraint(equalToConstant: size).isActive = true
        self.isOpaque = true
        self.layer.opacity = 0.8
    }
}

class CustomCameraButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonSetup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)!
        buttonSetup()
    }
    func buttonSetup() {
        let size:CGFloat = 40
        
        // Button Design
        self.setTitle("", for: .normal)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.widthAnchor.constraint(equalToConstant: size).isActive = true
        self.heightAnchor.constraint(equalToConstant: size).isActive = true
        self.isOpaque = true
        self.layer.opacity = 0.8
    }
}
