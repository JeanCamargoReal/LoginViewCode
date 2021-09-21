//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Jean Paulo Marcel Henrique de Camargo on 28/08/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var auth: Auth?
    var loginScreen: LoginScreen?
    var alert: Alert?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

extension LoginViewController: LoginScreenProtocol {
    func actionLoginButton() {
        guard let login = self.loginScreen else { return }
        
        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { usuario, error in
            if error != nil {
                self.alert?.getAlert(titulo: "Atenção", mensagem: "Dados incorretos, verifique e tente novamente.")
            } else {
                if usuario == nil {
                    self.alert?.getAlert(titulo: "Atenção", mensagem: "Tivemos um problema inesperado, tente novamente mais tarde.")
                } else {
                    self.alert?.getAlert(titulo: "Parabéns", mensagem: "Usuário logado com sucesso.")
                }
            }
        })
    }
    
    func actionRegisterButton() {
        let vc: RegisterViewController = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

