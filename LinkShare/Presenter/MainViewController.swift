//
//  MainViewController.swift
//  LinkShare
//
//  Created by Martin Čolja on 16/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    var mainViewRouter = MainViewRouter()
    
    @IBOutlet weak var childViewController: UIView!
    
    @IBOutlet weak var mainScreenToolbar: UIToolbar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainViewRouter.attach(controller: .feedViewController, to: self.childViewController, on: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func feedButtonPressed(_ sender: UIBarButtonItem) {
        self.mainViewRouter.attach(controller: .feedViewController, to: self.childViewController, on: self)
    }
    
    @IBAction func createPostButtonPressed(_ sender: UIBarButtonItem) {
        mainViewRouter.attach(controller: .cretePostViewController, to: childViewController, on: self)
    }
    
    @IBAction func messagesButtonPressed(_ sender: UIBarButtonItem) {
        mainViewRouter.attach(controller: .messagesViewController, to: childViewController, on: self)
    }

}
