//
//  Extensions.swift
//  LinkShare
//
//  Created by Martin Čolja on 17/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentSimpleAlert(_ title: String, _ message: String, _ buttonText: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonText, style: .destructive, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}


extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: K.Validity.emailRegex, options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    func isInvalidPassword() -> Bool {
        let regex = try! NSRegularExpression(pattern: K.Validity.passwordRegex, options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}

