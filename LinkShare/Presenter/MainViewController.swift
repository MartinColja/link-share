//
//  MainViewController.swift
//  LinkShare
//
//  Created by Martin Čolja on 16/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var feedViewController: FeedViewController?
    var createPostViewController: CreatePostViewController?
    var messagesViewController: MessagesViewController?
    var activeController: UIViewController?
    
    @IBOutlet weak var childViewController: UIView!
    
    @IBAction func feedButtonPressed(_ sender: UIButton) {
        if activeController != feedViewController{
            removeActiveViewController()
            pushViewController(viewController: feedViewController!)
        }
        
    }
    
    @IBAction func createPostButtonPressed(_ sender: UIButton) {
        if activeController != createPostViewController {
             removeActiveViewController()
             pushViewController(viewController: createPostViewController!)
        }
    }
    
    @IBAction func messagesButtonPressed(_ sender: UIButton) {
        if activeController != messagesViewController {
            removeActiveViewController()
            pushViewController(viewController: messagesViewController!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers()
        removeActiveViewController()
        pushViewController(viewController: feedViewController!)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    func setViewControllers() {
        let storyboard = UIStoryboard(name: K.Storyboard.storyBoard, bundle: nil)
        self.feedViewController =
            (storyboard.instantiateViewController(withIdentifier: K.Storyboard.feedController) as! FeedViewController)
        self.createPostViewController = (storyboard.instantiateViewController(withIdentifier: K.Storyboard.createPostController) as! CreatePostViewController)
        self.messagesViewController =  (storyboard.instantiateViewController(withIdentifier: K.Storyboard.messagesController) as! MessagesViewController)
    }
    
    func pushViewController(viewController: UIViewController) {
        viewController.view.frame = childViewController.frame
        addChild(viewController)
        childViewController.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        activeController = viewController
    
    }
    
    func removeActiveViewController() {
        activeController?.willMove(toParent: nil)
        activeController?.view.removeFromSuperview()
        activeController?.removeFromParent()
    }
    

    
    

}
