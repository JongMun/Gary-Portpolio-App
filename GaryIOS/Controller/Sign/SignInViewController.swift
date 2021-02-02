//
//  SignInViewController.swift
//  GaryIOS
//
//  Created by 정종문 on 2021/02/02.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwdField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signinAction(_ sender: UIButton) {
        // Firebase Sign In
    }
    
    @IBAction func signupAction(_ sender: UIButton) {
        self.emailField.text = ""
        self.passwdField.text = ""
    }
    
    @IBAction func passwdSearchAction(_ sender: UIButton) {
        self.emailField.text = ""
        self.passwdField.text = ""
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Keyboard Hiding When Other Field Tabbed
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
