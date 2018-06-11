//
//  Api.swift
//  TwitterApp
//
//  Created by Alaa on 6/9/18.
//  Copyright © 2018 Alaa. All rights reserved.
//

import UIKit
import Alamofire
class Api: NSObject {
    
    var params: [String:Any] = [:]
    var headers: [String:String] = [:]
    var method:HTTPMethod = .get
    var crusor = "-1"

    func getApiName() ->String {
        return ""
    }
    
    func parseResponse(response:[String: Any]) ->Any {
        return ""
    }
    func parseResponse(response:[[String: Any]]) ->Any {
        return ""
    }
}
