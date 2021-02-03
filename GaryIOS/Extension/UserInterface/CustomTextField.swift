//
//  CustomTextField.swift
//  GaryIOS
//
//  Created by 정종문 on 2021/02/02.
//

import UIKit
import Foundation

class CustomTextFieldforEmail: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        // Field Shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        
        self.textContentType = .emailAddress
        self.keyboardType = .emailAddress
        
        self.autocorrectionType = .no
        self.isSecureTextEntry = false
    }
}

class CustomTextFieldforPassword: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        // Field Shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        
        self.textContentType = .newPassword
        self.keyboardType = .default
        
        self.autocorrectionType = .no
        self.isSecureTextEntry = true
    }
}
