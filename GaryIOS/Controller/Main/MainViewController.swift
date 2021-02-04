//
//  MainViewController.swift
//  GaryIOS
//
//  Created by 정종문 on 2021/02/02.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
            self.btn1.setTitle("App Permission", for: .normal)
            self.btn2.setTitle("SignIn/Out/Up", for: .normal)
            self.btn3.setTitle("My Camera", for: .normal)
            self.btn4.setTitle("Chatting Someone", for: .normal)
            self.btn5.setTitle("Unknown", for: .normal)
            self.btn6.setTitle("Unknown", for: .normal)
            
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if CameraPermission().allowed && AudioPermission().allowed && PhotosPermission().allowed {
            self.btn2.isEnabled = true
            self.btn3.isEnabled = true
            self.btn4.isEnabled = true
            self.btn5.isEnabled = true
            self.btn6.isEnabled = true
        } else {
            self.btn2.isEnabled = false
            self.btn3.isEnabled = false
            self.btn4.isEnabled = false
            self.btn5.isEnabled = false
            self.btn6.isEnabled = false
        }
    }
}
