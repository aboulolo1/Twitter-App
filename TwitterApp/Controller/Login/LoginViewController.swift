//
//  LoginViewController.swift
//  TwitterApp
//
//  Created by Alaa on 6/8/18.
//  Copyright © 2018 Alaa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var presenter: LoginPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(delegate: self)
        presenter?.checkUserLogin()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func loginWithTwitter(_ sender: Any) {
       presenter?.loginWithTiwtter()
    }
}
extension LoginViewController:RegistrationDelegate
{
    func registrationDidSucceed() {
        self.present((self.storyboard?.instantiateViewController(withIdentifier: "followersNav"))!, animated: true, completion: nil)

    }
    
    func registrationDidFailed(message: String) {
        self.showAlert(title: "Error", message: message)
    }
    
    
}
