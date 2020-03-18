//
//  AuthInteractor.swift
//  LinkShare
//
//  Created by Martin Čolja on 17/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import Foundation
import Firebase

protocol RegisterInteractorDelegate {
    
    func registerInteractor(didFailWithError error: Error, _ registerInteractor: RegisterInteractor)
    func registerInteractor(didRegisterUser user: User, _ registerInteractor: RegisterInteractor)
}

class RegisterInteractor {
    
    var delegate: RegisterInteractorDelegate?
    
    func registerUser(_ email: String, _ username: String, _ password: String ) {
        let delegate = self.delegate
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                delegate?.registerInteractor(didFailWithError: e, self)
            } else if let result  = authResult {
                let changeRequest = result.user.createProfileChangeRequest()
                changeRequest.displayName = username
                changeRequest.commitChanges { (error) in
                    if let e = error {
                        delegate?.registerInteractor(didFailWithError: e, self)
                    } else {
                        delegate?.registerInteractor(didRegisterUser: result.user, self)
                    }
                }
            }
        }
    }
    
    func inputError(_ email: String?, _ username: String?, _ password: String?, _ confirmation: String?) -> String? {
        guard let safeEmail = email else {
            return "Email field cannot be empty"
        }
        if !safeEmail.isValidEmail() {
            return "Please enter a valid email adress"
        }
        guard let safeUsername = username else {
            return "Username field cannot be empty"
        }
        if safeUsername.count == 0 {
            return "Username field cannot be empty"
        }
        if safeUsername.count > K.Validity.maxUsernameLength {
            return "Please choose a shorter username"
        }
        guard let safePassword = password else {
            return "Password field cannot be empty"
        }
        if safePassword.isInvalidPassword() {
            return "the password must contain at least:\none uppercase letter\none lowecase letter\none digit\none special character\n8 or more characters"
        }
        guard let safeConfirmation = confirmation else {
            return "Password confirmation field cannot be empty"
        }
        if safePassword != safeConfirmation {
            return "Passwords must match"
        }
        return nil
    }
    
}
