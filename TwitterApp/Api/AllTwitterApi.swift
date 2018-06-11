//
//  AllTwitterApi.swift
//  TwitterApp
//
//  Created by Alaa on 6/9/18.
//  Copyright © 2018 Alaa. All rights reserved.
//

import UIKit
import Alamofire
protocol RequestDelegate {
    func requestDidSucess(response:Any, api: Api)
    func requestDidFailed(message:String,api: Api)
}
class AllTwitterApi: NSObject {
    fileprivate var api:Api!
    fileprivate var url:String = "https://api.twitter.com/"
    var delegate: RequestDelegate

    init(api:Api,delegate:RequestDelegate) {
        self.api = api
        self.delegate = delegate
        url = url + self.api.getApiName()
    }
    
    func excuteApi()
    {
        
        Alamofire.request(url, method:self.api.method, parameters: self.api.params,headers: self.api.headers).responseJSON(completionHandler: { (response) in
            self.parseResponse(response: response)
        })
    }
    fileprivate func parseResponse(response:DataResponse<Any>) {
        guard response.result.isSuccess else {
            self.delegate.requestDidFailed(message: (response.error?.localizedDescription)!, api: self.api)
        return
        }
        print(response.result.value ?? "")
        if api is TweetsApi
        {
            self.delegate.requestDidSucess(response: api.parseResponse(response: response.result.value as! [[String : Any]]), api: api)
            return
        }
        self.delegate.requestDidSucess(response: api.parseResponse(response: response.result.value as! [String : Any]), api: api)
    }

}
