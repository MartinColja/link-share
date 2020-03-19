//
//  Constants.swift
//  LinkShare
//
//  Created by Martin Čolja on 16/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import Foundation
import UIKit

struct K {
    static let cornerRadius: CGFloat = 0.25
    static let refreshThreshold = 10
    
    struct Validity {
        static let maxUsernameLength = 10
        static let emailRegex = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        static let passwordRegex = "^(.{0,7}|[^0-9]*|[^A-Z]*|[^a-z]*|[a-zA-Z0-9]*)$"
        
    }
    
    struct Storyboard {
        static let feedController = "FeedViewController"
        static let createPostController = "CreatePostViewController"
        static let messagesController = "MessagesViewController"
        static let mainViewController = "MainViewController"
        static let postViewController = "PostViewController"
        static let loginSegue = "LoginSegue"
        static let registerSegue = "RegisterSegue"
        static let cellSegue = "CellSegue"
        static let storyBoard = "Main"
        static let postCellIdentifier = "PostTableViewCell"
    }
    
    struct FStore {
        
        static let root = "posts"
        
        struct Post {
            static let url = "url"
            static let title = "name"
            static let timeAdded = "timeAdded"
            static let community = "community"
            static let originalPoster = "originalPoster"
        }

        struct OriginalPoster {
            static let email = "email"
            static let username = "username"
            static let karma = "karma"
        }
    }
    
}

