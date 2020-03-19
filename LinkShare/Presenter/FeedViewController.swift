//
//  FeedViewController.swift
//  LinkShare
//
//  Created by Martin Čolja on 16/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol FeedViewControllerDelegate {
    
    func feedViewController(didClickOnPost post: Post, _ feedViewController: FeedViewController)
}

class FeedViewController: UIViewController {
    
    private var feedViewInteractor = FeedViewInteractor()
    
    var delegate: FeedViewControllerDelegate?
    var shouldFetchAllData = true
    
    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedViewInteractor.delegate = self
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.register(UINib(nibName: K.Storyboard.postCellIdentifier, bundle: nil), forCellReuseIdentifier: K.Storyboard.postCellIdentifier)
        if shouldFetchAllData {
            feedViewInteractor.loadFeedPosts()
        } else {
            feedViewInteractor.loadFollowingPosts(communities: ["music"])
        }
    }

    
    @IBAction func communitySelectionValueChanged(_ sender: UISegmentedControl) {
        shouldFetchAllData.toggle()
        if shouldFetchAllData {
            feedViewInteractor.loadFeedPosts()
        } else {
            feedViewInteractor.loadFollowingPosts(communities: ["music"])
        }
    }
}

extension FeedViewController: FeedViewInteractorDelegate {
    func feedViewInteractor(didFailWithError error: Error, _ feedViewInteractor: FeedViewInteractor) {
        presentSimpleAlert("Alert", error.localizedDescription, "Ok")
    }
    
    func feedViewInteractor(didLoadData data: [Post], _ feedViewInteractor: FeedViewInteractor) {
        feedTableView.reloadData()
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if feedViewInteractor.posts.count == 0 {
            return 1
        }
        return feedViewInteractor.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCell = tableView.dequeueReusableCell(withIdentifier: K.Storyboard.postCellIdentifier, for: indexPath) as! PostTableViewCell
        
        if feedViewInteractor.posts.count == 0 {
            postCell.originalPosterLabel.isHidden = true
            postCell.communityLabel.isHidden = true
            postCell.byLabel.isHidden = true
            postCell.titleLabel.text = "Empty ..."
        } else {
            let post = feedViewInteractor.posts[indexPath.row]
            postCell.originalPosterLabel.isHidden = false
            postCell.communityLabel.isHidden = false
            postCell.byLabel.isHidden = false
            postCell.communityLabel.text = post.community
            postCell.originalPosterLabel.text = post.originalPoster.username
            postCell.titleLabel.text = post.title
        }
        
                
        return postCell
    }
    
    
}

extension FeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if feedViewInteractor.posts.count-1 == indexPath.row {
            if shouldFetchAllData {
                feedViewInteractor.loadMorePosts()
            } else {
                feedViewInteractor.loadMoreFollowingPosts(communities: ["music"])
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = feedViewInteractor.posts[indexPath.row]
        delegate?.feedViewController(didClickOnPost: post, self)
    }
    
}
