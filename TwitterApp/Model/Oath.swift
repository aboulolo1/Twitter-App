//
//	RootClass.swift
//
//	Create by Alaa on 10/6/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import RealmSwift



class Oath: Object {

	@objc dynamic var accessToken: String!
    @objc dynamic var tokenType: String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	class func fromDictionary(dictionary: [String:Any]) -> Oath	{
		let this = Oath()
		if let accessTokenValue = dictionary["access_token"] as? String{
			this.accessToken = accessTokenValue
		}
		if let tokenTypeValue = dictionary["token_type"] as? String{
			this.tokenType = tokenTypeValue
		}
		return this
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if accessToken != nil{
			dictionary["access_token"] = accessToken
		}
		if tokenType != nil{
			dictionary["token_type"] = tokenType
		}
		return dictionary
	}

  

}
