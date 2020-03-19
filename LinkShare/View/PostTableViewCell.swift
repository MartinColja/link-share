//
//  PostTableViewCell.swift
//  LinkShare
//
//  Created by Martin Čolja on 18/03/2020.
//  Copyright © 2020 Martin Čolja. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var communityLabel: UILabel!
    @IBOutlet weak var originalPosterLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var byLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func leftButton(_ sender: UIButton) {
        print("left button pressed")
    }
}
