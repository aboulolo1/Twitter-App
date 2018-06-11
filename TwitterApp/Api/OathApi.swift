//
//  OathApi.swift
//  TwitterApp
//
//  Created by Alaa on 6/10/18.
//  Copyright © 2018 Alaa. All rights reserved.
//

import UIKit

class OathApi: Api {
    static let grant_type = "grant_type"
    
    override func getApiName() -> String {
        return "oauth2/token/"
    }
    override func parseResponse(response: [String : Any]) -> Any {
        let oath = Oath.fromDictionary(dictionary: response)
        return oath
    }
    
}
