//
//	RootClass.swift
//
//	Create by Alaa on 11/6/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import RealmSwift

class Tweets: Object {

	@objc dynamic var createdAt: String!
	@objc dynamic var idStr: String!
	@objc dynamic var text: String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	class func fromDictionary(dictionary: [String:Any]) -> Tweets	{
		let this = Tweets()
		if let createdAtValue = dictionary["created_at"] as? String{
			this.createdAt = createdAtValue
		}
		if let idStrValue = dictionary["id_str"] as? String{
			this.idStr = idStrValue
		}
		if let textValue = dictionary["text"] as? String{
			this.text = textValue
		}
		return this
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if idStr != nil{
			dictionary["id_str"] = idStr
		}
		if text != nil{
			dictionary["text"] = text
		}
		return dictionary
	}


}
