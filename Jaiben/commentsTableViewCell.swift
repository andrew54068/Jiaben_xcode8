//
//  commentsTableViewCell.swift
//  Jaiben
//
//  Created by kidnapper on 27/03/2017.
//  Copyright © 2017 JaiBen. All rights reserved.
//

import UIKit

class commentsTableViewCell: UITableViewCell {
    
    @IBOutlet var commenterName: UILabel!
    @IBOutlet var commenterLevel: UILabel!
    @IBOutlet var commenterProfile: UIImageView!
    @IBOutlet var up: newButton!
    @IBOutlet var down: newButton!
    @IBOutlet var comment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        commenterProfile.layer.cornerRadius = commenterProfile.bounds.width/2
        commenterProfile.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
