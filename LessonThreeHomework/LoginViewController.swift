//
//  ViewController.swift
//  LessonThreeHomework
//
//  Created by Philip Noskov on 30.03.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTF.delegate = self
        self.passwordTF.delegate = self
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let succesLoginVC = segue.destination as? SuccesLoginViewController
        else {
            return
        }
        succesLoginVC.userName = nameTF.text
    }
    
    
    @IBAction func loginButtonPressed() {
        guard let userName = nameTF.text, userName == "User" else {
            showAlert(whith: "Wrong User Name",
                      and: "Please input correct User Name"
            )
            return
        }
        
        guard let userPassword = passwordTF.text, userPassword == "123456" else {
            showAlert(whith: "Wrong Password",
                      and: "Please input correct Password"
            )
            return
        }
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        showAlert(whith: "Forgot User Name?", and: "You user name is \"User\"!")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(whith: "Forgot Password?", and: "You password  is \"123456\"!")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let _ = segue.source as? SuccesLoginViewController else { return }
        nameTF.text = nil
        passwordTF.text = nil
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.nameTF {
            self.passwordTF.becomeFirstResponder()
        } else if textField == self.passwordTF {
            self.loginButtonPressed()
            performSegue(withIdentifier: "goToSuccesScene", sender: self)
        }
        return true
    }
    
    private func showAlert(whith title: String, and message: String) {
        let hintMessage = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        hintMessage.addAction(okAction)
        present(hintMessage, animated: true)
    }
}


