//
//  ViewController.swift
//  LinkShare
//
//  Created by Martin Čolja on 16/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = loginButton.frame.height * K.cornerRadius
        registerButton.layer.cornerRadius = registerButton.frame.height * K.cornerRadius
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }


}

