//
//  PostViewController.swift
//  LinkShare
//
//  Created by Martin Čolja on 18/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import UIKit
import WebKit

class PostViewController: UIViewController {
    
    var post: Post?
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let url = URL(string: post!.url) else {
            presentSimpleAlert("Alert", "Link provided by the original poster is not valid", "Cancel")
            return
        }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    

}
