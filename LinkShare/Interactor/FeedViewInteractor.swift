//
//  FeedViewInteractor.swift
//  LinkShare
//
//  Created by Martin Čolja on 18/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import Foundation
import Firebase

protocol FeedViewInteractorDelegate {
    
    func feedViewInteractor(didFailWithError error: Error, _ feedViewInteractor: FeedViewInteractor)
    func feedViewInteractor(didLoadData data: [Post], _ feedViewInteractor: FeedViewInteractor)

}

class FeedViewInteractor {

    var delegate: FeedViewInteractorDelegate?
    var lastSapshot: DocumentSnapshot?
    var posts: [Post] = []
    
    let db = Firestore.firestore()

    
    func loadFeedPosts() {
        posts = []
        db.collection(K.FStore.root)
            .order(by: K.FStore.Post.timeAdded, descending: true)
            .limit(to: 25)
            .getDocuments(completion: handleData(querySnapshot:error:))
        
    }
    
    func loadMorePosts() {
           guard let lastSnapshot = self.lastSapshot else { return }
           db.collection(K.FStore.root)
               .order(by: K.FStore.Post.timeAdded, descending: true)
               .start(afterDocument: lastSnapshot)
               .limit(to: 10)
               .getDocuments(completion: handleData(querySnapshot:error:))
       }
    
    func loadFollowingPosts(communities: [String]){
        posts = []
        db.collection(K.FStore.root)
            .whereField(K.FStore.Post.community, in: communities)
            .order(by: K.FStore.Post.timeAdded, descending: true)
            .limit(to: 25)
            .getDocuments(completion: handleData(querySnapshot:error:))
            
    }
    
    func loadMoreFollowingPosts(communities: [String]) {
        guard let lastSnapshot = self.lastSapshot else { return }
        db.collection(K.FStore.root)
            .whereField(K.FStore.Post.community, in: communities)
            .order(by: K.FStore.Post.timeAdded, descending: true)
            .start(afterDocument: lastSnapshot)
            .limit(to: 10)
            .getDocuments(completion: handleData(querySnapshot:error:))
    }
    
    func handleData(querySnapshot: QuerySnapshot?, error: Error?) {
        if let e = error {
            self.delegate?.feedViewInteractor(didFailWithError: e, self)
            print(e.localizedDescription)
        } else if let snapshot = querySnapshot {
            snapshot.documents.forEach({ (queryDocumentSnapshot) in
                self.posts.append(Post(data: queryDocumentSnapshot.data()))
            })
            self.lastSapshot = snapshot.documents.last
            self.delegate?.feedViewInteractor(didLoadData: self.posts, self)
        }
    }

}

