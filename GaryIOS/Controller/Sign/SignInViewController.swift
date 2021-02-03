//
//  SignInViewController.swift
//  GaryIOS
//
//  Created by 정종문 on 2021/02/02.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwdField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signinAction(_ sender: UIButton) {
        guard let email: String = self.emailField.text, email.isEmpty == false else {
            self.view.messageShow(self, message: "이메일을 확인해주세요.")
            return
        }
        guard let passwd: String = self.passwdField.text, passwd.isEmpty == false else {
            self.view.messageShow(self, message: "비밀번호를 확인해주세요.")
            return
        }
        
        // Firebase Sign In
        Auth.auth().signIn(withEmail: email, password: passwd) {
            ( result, error ) in
            if let error = error {
                self.view.messageShow(self, message: "로그인에 실패하였습니다.")
                print("Error : \(error.localizedDescription)")
                return
            }
            
            self.view.messageShow(self, message: "로그인에 성공하였습니다.")
        }
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
