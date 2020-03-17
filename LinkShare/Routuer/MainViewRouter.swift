//
//  HomeScreenRouter.swift
//  LinkShare
//
//  Created by Martin Čolja on 17/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import Foundation
import UIKit

enum Controller {
    case feedViewController
    case cretePostViewController
    case messagesViewController
}

class MainViewRouter {
    
    private var activeViewController: Controller?
    
    private var storyboard: UIStoryboard {
        return UIStoryboard(name: K.Storyboard.storyBoard, bundle: nil)
    }
    
    private var feedViewController: FeedViewController {
        return storyboard
            .instantiateViewController(withIdentifier:
                K.Storyboard.feedController)
            as! FeedViewController
        
    }
    
    private var createPostViewController: CreatePostViewController {
        return storyboard
            .instantiateViewController(withIdentifier:
                K.Storyboard.createPostController)
            as! CreatePostViewController
    }
    
    private var messagesViewController: MessagesViewController {
        return storyboard
            .instantiateViewController(withIdentifier:
                K.Storyboard.messagesController)
            as! MessagesViewController
    }
    
    
    func attach(controller: Controller, to child: UIView, on parent: UIViewController) {
        if controller != activeViewController {
            let oldViewController = translateFromEnum(controller: activeViewController)
            let newViewController = translateFromEnum(controller: controller)!
            activeViewController = controller
            remove(viewController: oldViewController)
            push(viewController: newViewController, to: child, on: parent)
        }
    }
    
    private func push(viewController: UIViewController, to child: UIView, on parent: UIViewController) {
        viewController.view.frame = child.frame
        parent.addChild(viewController)
        child.addSubview(viewController.view)
        viewController.didMove(toParent: parent)
    }
    
    private func remove(viewController: UIViewController?) {
        viewController?.willMove(toParent: nil)
        viewController?.view.removeFromSuperview()
        viewController?.removeFromParent()
    }
    
    private func translateFromEnum(controller: Controller?) -> UIViewController? {
        switch controller {
        case .feedViewController:
            return feedViewController
        case .cretePostViewController:
            return createPostViewController
        case .messagesViewController:
            return messagesViewController
        case nil:
            return nil
        }
    }
    
}
