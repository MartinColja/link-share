//
//  Post.swift
//  LinkShare
//
//  Created by Martin Čolja on 18/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import Foundation

struct Post {
    
    var url: String
    var title: String
    var community: String
    var timeAdded: TimeInterval
    var originalPoster: OriginalPoster
    
    init(data: [String : Any]) {
        url = data[K.FStore.Post.url] as! String
        title = data[K.FStore.Post.title] as! String
        community = data[K.FStore.Post.community] as! String
        timeAdded = data[K.FStore.Post.timeAdded] as! TimeInterval
        originalPoster = OriginalPoster(data: data[K.FStore.Post.originalPoster] as! [String : Any] )
    }
    
}

struct OriginalPoster {
    
    var email: String
    var username: String
    var karma: Int

    
    init(data: [String : Any]) {
        email = data[K.FStore.OriginalPoster.email] as! String
        username = data[K.FStore.OriginalPoster.username] as! String
        karma = data[K.FStore.OriginalPoster.karma] as! Int

    }
}
