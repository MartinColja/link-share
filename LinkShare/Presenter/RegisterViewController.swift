//
//  RegisterViewController.swift
//  LinkShare
//
//  Created by Martin Čolja on 16/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
        
    private let registerInteractor = RegisterInteractor()
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerInteractor.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        let email = emailTextField.text
        let username = usernameTextField.text
        let password = passwordTextField.text
        let confirmation = confirmPasswordTextField.text
        let errorMessage = registerInteractor.inputError(email, username, password, confirmation)
        if let message = errorMessage {
            self.presentSimpleAlert("Alert", message, "Ok")
        } else {
            registerInteractor.registerUser(email!, username!, password!)
        }
    }

}

import Firebase
extension RegisterViewController: RegisterInteractorDelegate {
    func registerInteractor(didFailWithError error: Error, _ registerInteractor: RegisterInteractor) {
        self.presentSimpleAlert("Alert", error.localizedDescription, "Ok")
        
    }
    
    func registerInteractor(didRegisterUser user: User, _ registerInteractor: RegisterInteractor) {
        self.performSegue(withIdentifier: K.Storyboard.registerSegue, sender: self)
    }
    
}
