//
//  FollowersApi.swift
//  TwitterApp
//
//  Created by Alaa on 6/9/18.
//  Copyright © 2018 Alaa. All rights reserved.
//

import UIKit

class FollowersApi: Api {
    static let user_id = "user_id"
    static let cursor = "cursor"
    static let counts = "count"
    static let skip_status = "skip_status"
    static let include_user_entities = "include_user_entities"
    static let screen_name = "screen_name"
    override func getApiName() -> String {
        return "1.1/followers/list.json"
    }
    override func parseResponse(response: [String : Any]) ->Any {
        let followers = Followers.fromDictionary(dictionary: response)
        return followers
    }
}
