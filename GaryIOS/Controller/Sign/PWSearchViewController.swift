//
//  PWSearchViewController.swift
//  GaryIOS
//
//  Created by 정종문 on 2021/02/02.
//

import UIKit
import FirebaseAuth

class PWSearchViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var validationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.validationLabel.isHidden = true
    }
    
    @IBAction func emailCheck(_ sender: UITextField) {
        guard let email: String = self.emailField.text, email.isEmpty == false else {
            self.view.messageShow(self, message: "이메일란을 확인해주십시오.")
            return
        }
        
        Auth.auth().fetchSignInMethods(forEmail: email, completion: {
            (signInMethods, error) in
            if let error = error {
                print("Error : \(error.localizedDescription)")
            }
            
            if signInMethods != nil {
                DispatchQueue.main.async {
                    self.validationLabel.isHidden = false
                    self.validationLabel.text = "이메일이 확인되었습니다."
                    self.validationLabel.textColor = .black
                }
            } else {
                DispatchQueue.main.async {
                    self.validationLabel.isHidden = false
                    self.validationLabel.text = "가입된 이메일이 아닙니다."
                    self.validationLabel.textColor = .red
                }
            }
        })
    }
    
    @IBAction func updatePassword(_ sender: UIButton) {
        guard let email: String = self.emailField.text, email.isEmpty == false else {
            self.view.messageShow(self, message: "이메일란을 확인해주십시오.")
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) {
            ( error ) in
            if let error = error {
                print("sendPasswordReset : \(error)")
                return
            }
            
            self.view.messageShow(self, message: "비밀번호 재설정 이메일이 발송되었습니다.")
            print("변경된 비밀번호가 이메일로 보내짐.")
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
