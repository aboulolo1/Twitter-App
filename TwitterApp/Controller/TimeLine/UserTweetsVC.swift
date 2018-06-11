//
//  UserTweetsVC.swift
//  TwitterApp
//
//  Created by Alaa on 6/11/18.
//  Copyright © 2018 Alaa. All rights reserved.
//

import UIKit
import SDWebImage

class UserTweetsVC: UIViewController {
    var tweetsPresenter: UserTweetsPresenter?
    var allTweets:[Tweets] = []

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tweetsTB: UITableView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileBackgroundImg: UIImageView!
    var user : User! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = user.name
        profileImg.sd_setImage(with: URL(string:user.profileImageUrlHttps), completed: nil)
        if let imgBackground = user.profileBackgroundImageUrlHttps {
            profileBackgroundImg.sd_setImage(with: URL(string:imgBackground), placeholderImage: #imageLiteral(resourceName: "background"))
        }


       
        self.activityIndicator.startAnimating()
        tweetsPresenter = UserTweetsPresenter(delegate: self)
        tweetsPresenter?.getUserTweets(screenName: user.screenName)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

extension UserTweetsVC:UserTweetsDelegate,UITableViewDataSource,UITableViewDelegate
{
    func UserTweetsDidSucceed(tweets: [Tweets]) {
        self.activityIndicator.stopAnimating()
        self.allTweets = tweets
        self.tweetsTB.reloadData()
    }
    
    func UserTweetsDidFailed(message: String) {
        self.showAlert(title: "error", message: message)
        self.activityIndicator.stopAnimating()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if allTweets.count>0  {
            return allTweets.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetsTableViewCell", for: indexPath) as! TweetsTableViewCell
        cell.tweetsText.text = allTweets[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    
}

