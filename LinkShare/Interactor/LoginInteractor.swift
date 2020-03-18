//
//  AuthInteractor.swift
//  LinkShare
//
//  Created by Martin Čolja on 17/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import Foundation
import Firebase

protocol LoginInteractorDelegate {
    
    func loginInteractor(didFailWithError error: Error, _ loginInteractor: LoginInteractor)
    func loginInteractor(didLoginUser user: User, _ loginInteractor: LoginInteractor)
}

class LoginInteractor {
    
    var delegate: LoginInteractorDelegate?
    
    func loginUser(_ email: String, _ password: String ) {
        let delegate = self.delegate
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            if let e = error {
                delegate?.loginInteractor(didFailWithError: e, self)
            } else if let user = authDataResult?.user {
                delegate?.loginInteractor(didLoginUser: user, self)
            }
        }
    }

    
}
