//
//  FollowersPresenter.swift
//  TwitterApp
//
//  Created by Alaa on 6/9/18.
//  Copyright © 2018 Alaa. All rights reserved.
//

import UIKit
import RealmSwift

protocol FollowersDelegate {
    func followersDidSucceed(followers:Followers)
    func followersDidFailed(message: String)
}
class FollowersPresenter: NSObject {
    
    var delegate: FollowersDelegate
    var users = List<User>()
   fileprivate let realm = try! Realm()

    init(delegate:FollowersDelegate) {
        self.delegate = delegate
    }
    func getFollowers(cursor:String) {
        if cursor != "0"{
            let followersApi = FollowersApi()
            var params = [String:String]()
            let profile = realm.objects(Profile.self).first
            params[FollowersApi.user_id] = profile?.user_id
            params[FollowersApi.screen_name] = profile?.user_name
            params[FollowersApi.cursor] = cursor
            params[FollowersApi.skip_status] = "true"
            params[FollowersApi.include_user_entities] = "true"
            params[FollowersApi.counts] = "10"
            followersApi.crusor = cursor
            followersApi.params = params
            followersApi.method = .get
            followersApi.headers = ["Authorization":"bearer "+(profile?.user_token)!]
            let apiManager = AllTwitterApi(api: followersApi, delegate: self)
            apiManager.excuteApi()
        }
        
    }
   
    fileprivate func addFollowers(followers:Followers) {
        try! realm.write {
            if followers.users.count > 0
            {
                realm.add(followers)
            }
        }
    }
     func getFollowersCached() {
        let followersCached = realm.objects(Followers.self)
        if followersCached.count > 0
        {
            self.users = followersCached.last!.users
            self.delegate.followersDidSucceed(followers:followersCached.last!)
        }
    }
}
extension FollowersPresenter:RequestDelegate
{
    func requestDidSucess(response: Any, api: Api) {
        if api.crusor == "-1" {
            try! realm.write {
                users.removeAll()
            }
        }
        let followers = response as! Followers
        if followers.users.count > 0 {
            for us in followers.users {
                try! realm.write {
                    self.users.append(us)
                }
            }
        }
        followers.users = self.users
        self.addFollowers(followers: followers)
        self.delegate.followersDidSucceed(followers:followers)
    }
    
    func requestDidFailed(message: String, api: Api) {
        self.delegate.followersDidFailed(message: message)
    }
    
    
}
