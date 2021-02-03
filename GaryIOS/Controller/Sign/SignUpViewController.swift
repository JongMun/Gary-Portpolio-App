//
//  SignUpViewController.swift
//  GaryIOS
//
//  Created by 정종문 on 2021/02/02.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwdField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signupCompleteAction(_ sender: UIButton) {
        guard let email: String = self.emailField.text, email.isEmpty == false else {
            self.view.messageShow(self, message: "이메일을 확인해주세요.")
            return
        }
        guard let passwd: String = self.passwdField.text, passwd.isEmpty == false else {
            self.view.messageShow(self, message: "비밀번호를 확인해주세요.")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: passwd) {
            ( result, error ) in
            if let error = error {
                print("Error : \(error.localizedDescription)")
                return
            }
            
            self.view.messageShow(self, message: "가입이 완료되었습니다.")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                do {
                    try Auth.auth().signOut()
                } catch let error as NSError {
                    print("Sign Out Error : \(error)")
                }
                self.dismiss(animated: true, completion: nil)
            })
        }
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Keyboard Hiding When Other Field Tabbed
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
