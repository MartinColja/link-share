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
    var mainViewInteractor = MainViewInteractor()
    private var feedViewController: FeedViewController?
    var postViewController: PostViewController?
    private var createPostViewController: CreatePostViewController?
    var messagesViewController: MessagesViewController?


    
    @IBOutlet weak var childViewController: UIView!
    
    @IBOutlet weak var mainScreenToolbar: UIToolbar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewControllers()
        feedViewController!.delegate = self
        mainViewRouter.attach(controller: feedViewController!, to: self.childViewController, on: self)
    }
    
    private func initViewControllers() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.postViewController = (storyboard.instantiateViewController(withIdentifier: K.Storyboard.postViewController) as! PostViewController)
        self.createPostViewController = (storyboard.instantiateViewController(withIdentifier: K.Storyboard.createPostController) as! CreatePostViewController)
        self.feedViewController = (storyboard.instantiateViewController(withIdentifier: K.Storyboard.feedController) as! FeedViewController)
        self.messagesViewController = (storyboard.instantiateViewController(withIdentifier: K.Storyboard.messagesController) as! MessagesViewController)
    }

    
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.isNavigationBarHidden = true
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        navigationController?.isNavigationBarHidden = false
//    }
    
    @IBAction func feedButtonPressed(_ sender: UIBarButtonItem) {
        self.mainViewRouter.attach(controller: feedViewController!, to: childViewController, on: self)
        
    }
    
    @IBAction func createPostButtonPressed(_ sender: UIBarButtonItem) {
        mainViewRouter.attach(controller: createPostViewController!, to: childViewController, on: self)
    }
    
    @IBAction func messagesButtonPressed(_ sender: UIBarButtonItem) {
        mainViewRouter.attach(controller: messagesViewController!, to: childViewController, on: self)
    }
    
}

extension MainViewController: FeedViewControllerDelegate {
    func feedViewController(didClickOnPost post: Post, _ feedViewController: FeedViewController) {
        print("username: \(post.originalPoster.username)")
        self.postViewController!.post = post
        self.mainViewRouter.attach(controller: postViewController!, to: childViewController, on: self)
    }
}
