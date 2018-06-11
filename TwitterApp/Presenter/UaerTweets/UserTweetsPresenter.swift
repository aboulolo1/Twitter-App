//
//  UserTweetsPresenter.swift
//  TwitterApp
//
//  Created by Alaa on 6/11/18.
//  Copyright © 2018 Alaa. All rights reserved.
//

import UIKit
import RealmSwift

protocol UserTweetsDelegate {
    func UserTweetsDidSucceed(tweets:[Tweets])
    func UserTweetsDidFailed(message: String)
}
class UserTweetsPresenter: NSObject {
    var delegate: UserTweetsDelegate
    fileprivate let realm = try! Realm()

    init(delegate:UserTweetsDelegate) {
        self.delegate = delegate
    }
    
    func getUserTweets(screenName:String) {
        let tweetsApi = TweetsApi()
        let profile = realm.objects(Profile.self).first
        var params = [String:String]()
        params[TweetsApi.screen_name] = screenName
        params[TweetsApi.counts] = "10"
        tweetsApi.params = params
        tweetsApi.method = .get
        tweetsApi.headers = ["Authorization":"bearer "+(profile?.user_token)!]
        let apiManager = AllTwitterApi(api: tweetsApi, delegate: self)
        apiManager.excuteApi()
    }
}

extension UserTweetsPresenter:RequestDelegate
{
    func requestDidSucess(response: Any, api: Api) {
        self.delegate.UserTweetsDidSucceed(tweets: response as! [Tweets])
    }
    
    func requestDidFailed(message: String, api: Api) {
        self.delegate.UserTweetsDidFailed(message: message)
    }
    
    
}

