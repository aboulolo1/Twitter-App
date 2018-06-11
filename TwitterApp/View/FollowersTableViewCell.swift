//
//  FollowersTableViewCell.swift
//  TwitterApp
//
//  Created by Alaa on 6/10/18.
//  Copyright © 2018 Alaa. All rights reserved.
//

import UIKit
import SDWebImage

class FollowersTableViewCell: UITableViewCell {

    @IBOutlet weak var userBio: UILabel!
    @IBOutlet weak var userHandle: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func loadCell(user:User) {
        self.userName.text = user.name
        self.userHandle.text = user.screenName
        if user.descriptionField.isEmpty {
            self.userBio.text = ""
        }
        else
        {
            self.userBio.text = user.descriptionField
        }
        imgUser.sd_setImage(with: URL(string: user.profileImageUrlHttps), completed: nil)
        
    }
}
