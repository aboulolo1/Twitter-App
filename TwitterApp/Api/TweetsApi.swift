//
//  TweetsApi.swift
//  TwitterApp
//
//  Created by Alaa on 6/11/18.
//  Copyright © 2018 Alaa. All rights reserved.
//

import UIKit

class TweetsApi: Api {
    static let screen_name = "screen_name"
    static let counts = "count"

    override func getApiName() -> String {
        return "1.1/statuses/user_timeline.json"
    }
    override func parseResponse(response: [[String : Any]]) ->Any {
        var tweets:[Tweets] = []
        for tweet in response {
            tweets.append(Tweets.fromDictionary(dictionary: tweet))
        }
        return tweets
    }
}
