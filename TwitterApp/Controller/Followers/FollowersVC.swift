//
//  FollowersVC.swift
//  TwitterApp
//
//  Created by Alaa on 6/9/18.
//  Copyright © 2018 Alaa. All rights reserved.
//

import UIKit
import ESPullToRefresh

class FollowersVC: UIViewController {
    var followersPresenter: FollowersPresenter?
    var followers:Followers = Followers()
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var followerTB: UITableView!
    
    fileprivate var cursor:String = "-1"
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        followersPresenter = FollowersPresenter(delegate: self)
        followersPresenter?.getFollowersCached()
        followersPresenter?.getFollowers(cursor: "-1")
       
    }
    override func viewDidAppear(_ animated: Bool) {
        self.followerTB.es.addPullToRefresh {
            [unowned self] in
            self.cursor = "-1"
            self.followersPresenter?.getFollowers(cursor: self.cursor)
            self.followerTB.es.stopPullToRefresh(ignoreDate: true, ignoreFooter: false)
            self.followerTB.es.resetNoMoreData()
            
        }
        self.followerTB.es.addInfiniteScrolling {
            [unowned self] in
            self.followersPresenter?.getFollowers(cursor: self.cursor)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
extension FollowersVC:FollowersDelegate,UITableViewDataSource,UITableViewDelegate
{
    func followersDidSucceed(followers: Followers) {
        if followers.nextCursor == 0
        {
            self.followerTB.es.noticeNoMoreData()
        }
        self.followerTB.es.stopLoadingMore()
        self.cursor = followers.nextCursorStr
        activityIndicator.stopAnimating()
        self.followers = followers
        self.followerTB.reloadData()
    }
    
    
    func followersDidFailed(message: String) {
        activityIndicator.stopAnimating()
        self.showAlert(title: "Error", message: message)
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if followers.users.count>0  {
            return followers.users.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "followersTableViewCell", for: indexPath) as! FollowersTableViewCell
        
        cell.loadCell(user: followers.users[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tweetsVC = self.storyboard?.instantiateViewController(withIdentifier: "UserTweets") as! UserTweetsVC
        tweetsVC.user = self.followers.users[indexPath.row]
        self.navigationController?.pushViewController(tweetsVC, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    

    
}
