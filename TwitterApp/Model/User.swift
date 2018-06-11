//
//	User.swift
//
//	Create by Alaa on 9/6/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport


import RealmSwift


class User: Object {

	@objc dynamic var rootClass: Followers!
	@objc dynamic var descriptionField: String!
	@objc dynamic var id: Int = 0 
	@objc dynamic var idStr: String!
	@objc dynamic var name: String!
	@objc dynamic var profileImageUrl: String!
	@objc dynamic var profileImageUrlHttps: String!
	@objc dynamic var screenName: String!
    @objc dynamic var profileBackgroundImageUrl: String!
    @objc dynamic var profileBackgroundImageUrlHttps: String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	class func fromDictionary(dictionary: [String:Any]) -> User	{
		let this = User()
		if let rootClassData = dictionary["rootClass"] as? [String:Any]{
            this.rootClass = Followers.fromDictionary(dictionary: rootClassData)
		}
		if let descriptionFieldValue = dictionary["description"] as? String{
			this.descriptionField = descriptionFieldValue
		}
		if let idValue = dictionary["id"] as? Int{
			this.id = idValue
		}
		if let idStrValue = dictionary["id_str"] as? String{
			this.idStr = idStrValue
		}
		if let nameValue = dictionary["name"] as? String{
			this.name = nameValue
		}
		if let profileImageUrlValue = dictionary["profile_image_url"] as? String{
			this.profileImageUrl = profileImageUrlValue
		}
		if let profileImageUrlHttpsValue = dictionary["profile_image_url_https"] as? String{
			this.profileImageUrlHttps = profileImageUrlHttpsValue
		}
        if let profileBackgroundImageUrlValue = dictionary["profile_background_image_url"] as? String{
            this.profileBackgroundImageUrl = profileBackgroundImageUrlValue
        }
        if let profileBackgroundImageUrlHttpsValue = dictionary["profile_background_image_url_https"] as? String{
            this.profileBackgroundImageUrlHttps = profileBackgroundImageUrlHttpsValue
        }
		if let screenNameValue = dictionary["screen_name"] as? String{
			this.screenName = screenNameValue
		}
		return this
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if rootClass != nil{
			dictionary["rootClass"] = rootClass.toDictionary()
		}
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		dictionary["id"] = id
		if idStr != nil{
			dictionary["id_str"] = idStr
		}
		if name != nil{
			dictionary["name"] = name
		}
		if profileImageUrl != nil{
			dictionary["profile_image_url"] = profileImageUrl
		}
		if profileImageUrlHttps != nil{
			dictionary["profile_image_url_https"] = profileImageUrlHttps
		}
        if profileBackgroundImageUrl != nil{
            dictionary["profile_background_image_url"] = profileBackgroundImageUrl
        }
        if profileBackgroundImageUrlHttps != nil{
            dictionary["profile_background_image_url_https"] = profileBackgroundImageUrlHttps
        }
		if screenName != nil{
			dictionary["screen_name"] = screenName
		}
		return dictionary
	}

}
