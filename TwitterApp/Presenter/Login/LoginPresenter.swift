//
//  LoginPresenter.swift
//  TwitterApp
//
//  Created by Alaa on 6/8/18.
//  Copyright © 2018 Alaa. All rights reserved.
//

import UIKit
import RealmSwift
protocol RegistrationDelegate {
    func registrationDidSucceed()
    func registrationDidFailed(message: String)
}

class LoginPresenter: NSObject {
    var delegate: RegistrationDelegate
    private var myProfile : Results<Profile>!
    private let profile = Profile()

    init(delegate:RegistrationDelegate) {
        self.delegate = delegate
    }
    
    
    func checkUserLogin() {
        let realm = try! Realm()
        myProfile = realm.objects(Profile.self)
        if myProfile.count > 0 {
            guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return }
            let rootController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "followersNav")
            appDel.window?.rootViewController = rootController
        }
    }
    
    func loginWithTiwtter() {
        TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
            if (session != nil) {
                self.profile.user_id = session?.userID ?? ""
                self.profile.user_name = session?.userName ?? ""
                self.oauthentication()
            } else {
                self.delegate.registrationDidFailed(message: error?.localizedDescription ?? "Error")
            }
        })
    }
    func oauthentication() {
        let oathApi = OathApi()
        var params = [String:String]()
        params[OathApi.grant_type] = "client_credentials"
        oathApi.params = params
        oathApi.method = .post
        let base64 = Helper.consumerKey + ":" + Helper.consumerSecret
        oathApi.headers = ["Authorization":"Basic "+base64.toBase64()]
        let apiManager = AllTwitterApi(api: oathApi, delegate: self)
        apiManager.excuteApi()

    }
}
extension LoginPresenter:RequestDelegate
{
    func requestDidSucess(response: Any, api: Api) {
        let oathResponse = response as! Oath
        profile.user_token = oathResponse.accessToken
        let realm = try! Realm()
        try! realm.write {
            realm.add(self.profile)
        }
        self.delegate.registrationDidSucceed();
    }
    
    func requestDidFailed(message: String, api: Api) {
        self.delegate.registrationDidFailed(message: message)

    }
    
    
}
