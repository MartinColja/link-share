//
//  MainViewInteractor.swift
//  LinkShare
//
//  Created by Martin Čolja on 18/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import Foundation
import Firebase

protocol MainViewInteractorDelegate {
    
    func mainViewInteractor(didFailWithError error: Error, _ mainViewInteractor: MainViewInteractor)
    func mainViewInteractor(didLoadData data: [Post], _ mainViewInteractor: MainViewInteractor)

}

class MainViewInteractor {

    var delegate: MainViewInteractorDelegate?
    var lastSapshot: DocumentSnapshot?
    var posts: [Post] = []
    
    let db = Firestore.firestore()

    
    func loadFeedPosts() {
        db.collection("tests")
            .order(by: K.FStore.Post.timeAdded)
            .limit(to: 25)
            .getDocuments { (querySnapshot, error) in
            if let e = error {
                self.delegate?.mainViewInteractor(didFailWithError: e, self)
            } else if let snapshot = querySnapshot {
                snapshot.documents.forEach({ (queryDocumentSnapshot) in
                    self.posts.append(Post(data: queryDocumentSnapshot.data()))
                })
                self.lastSapshot = snapshot.documents.last
                self.delegate?.mainViewInteractor(didLoadData: self.posts, self)
            }
            
        }
        
    }
    
    func loadMorePosts() {
        guard let lastSnapshot = self.lastSapshot else { return }
        db.collection("tests")
            .order(by: K.FStore.Post.timeAdded)
            .start(afterDocument: lastSnapshot)
            .limit(to: 10)
            .getDocuments { (snapshot, error) in
                if let e = error {
                    self.delegate?.mainViewInteractor(didFailWithError: e, self)
                } else if let snapshot = snapshot?.documents{
                    snapshot.forEach({ (queryDocumentSnapshot) in
                        self.posts.append(Post(data: queryDocumentSnapshot.data()))
                    })
                    self.lastSapshot = snapshot.last
                    self.delegate?.mainViewInteractor(didLoadData: self.posts, self)
                }
        }
    }

}
