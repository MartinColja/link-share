//
//  ViewController.swift
//  LinkShare
//
//  Created by Martin Čolja on 16/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = loginButton.frame.height * K.cornerRadius
        registerButton.layer.cornerRadius = registerButton.frame.height * K.cornerRadius
        
//        let db = Firestore.firestore()
//        for i in 0...150 {
//            if i%3 == 0 {
//                db.collection(K.FStore.root).addDocument(data: [
//                    K.FStore.Post.url: "https://stackoverflow.com/",
//                    K.FStore.Post.title: "Look at this cool website",
//                    K.FStore.Post.community: "programming",
//                    K.FStore.Post.timeAdded: NSDate().timeIntervalSince1970,
//                    K.FStore.Post.originalPoster: [
//                        K.FStore.OriginalPoster.email: "name.surname@\(i).com",
//                        K.FStore.OriginalPoster.username: "Username\(i)",
//                        K.FStore.OriginalPoster.karma: 0
//                    ]
//                ]) { err in
//                    if let err = err {
//                        print("Error adding document: \(err)")
//                    } else {
//                        print("Document \(i) added")
//                    }
//                }
//            } else if i%3 == 1 {
//                db.collection(K.FStore.root).addDocument(data: [
//                    K.FStore.Post.url: "https://www.rocketleague.com/",
//                    K.FStore.Post.title: "Look at this cool website",
//                    K.FStore.Post.community: "esports",
//                    K.FStore.Post.timeAdded: NSDate().timeIntervalSince1970,
//                    K.FStore.Post.originalPoster: [
//                        K.FStore.OriginalPoster.email: "name.surname@\(i).com",
//                        K.FStore.OriginalPoster.username: "Username\(i)",
//                        K.FStore.OriginalPoster.karma: 0
//                    ]
//                ]) { err in
//                    if let err = err {
//                        print("Error adding document: \(err)")
//                    } else {
//                        print("Document \(i) added")
//                    }
//                }
//            } else {
//                db.collection(K.FStore.root).addDocument(data: [
//                    K.FStore.Post.url: "https://www.spotify.com/",
//                    K.FStore.Post.title: "Look at this cool website",
//                    K.FStore.Post.community: "music",
//                    K.FStore.Post.timeAdded: NSDate().timeIntervalSince1970,
//                    K.FStore.Post.originalPoster: [
//                        K.FStore.OriginalPoster.email: "name.surname@\(i).com",
//                        K.FStore.OriginalPoster.username: "Username\(i)",
//                        K.FStore.OriginalPoster.karma: 0
//                    ]
//                ]) { err in
//                    if let err = err {
//                        print("Error adding document: \(err)")
//                    } else {
//                        print("Document \(i) added")
//                    }
//                }
//            }
//
//        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }


}

