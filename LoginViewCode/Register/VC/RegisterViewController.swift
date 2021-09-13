//
//  RegisterViewController.swift
//  LoginViewCode
//
//  Created by Jean Camargo on 09/09/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var registerScreen: RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerScreen?.configTextFieldDelegate(delegate: self)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
