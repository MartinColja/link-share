//
//  HomeScreenRouter.swift
//  LinkShare
//
//  Created by Martin Čolja on 17/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import Foundation
import UIKit

class MainViewRouter {
    
    private var activeViewController: UIViewController?
    
    
    func attach(controller: UIViewController, to child: UIView, on parent: UIViewController) {
        if controller != activeViewController {
            let oldViewController = activeViewController
            activeViewController = controller
            remove(viewController: oldViewController)
            push(viewController: controller, to: child, on: parent)
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
    
}
