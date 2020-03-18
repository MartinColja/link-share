//
//  LoginViewController.swift
//  LinkShare
//
//  Created by Martin Čolja on 16/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    private let loginInteractor = LoginInteractor()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        loginInteractor.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        loginInteractor.loginUser(email, password)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

import Firebase
extension LoginViewController: LoginInteractorDelegate {
    func loginInteractor(didFailWithError error: Error, _ loginInteractor: LoginInteractor) {
        self.presentSimpleAlert("Alert", error.localizedDescription, "Ok")
    }
    
    func loginInteractor(didLoginUser user: User, _ loginInteractor: LoginInteractor) {
        self.performSegue(withIdentifier: K.Storyboard.loginSegue, sender: self)
    }
}
