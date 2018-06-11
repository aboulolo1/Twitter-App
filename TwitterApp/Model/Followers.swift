//
//	RootClass.swift
//
//	Create by Alaa on 9/6/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport


import RealmSwift

class Followers: Object {

    @objc dynamic var nextCursor: Int = 0
	 @objc dynamic var nextCursorStr: String!
    @objc dynamic var previousCursor: Int = 0
	 @objc dynamic var previousCursorStr: String!
    var users = List<User>()
    
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	class func fromDictionary(dictionary: [String:Any]) -> Followers	{
		let this = Followers()
		if let nextCursorValue = dictionary["next_cursor"] as? Int{
			this.nextCursor = nextCursorValue
		}
		if let nextCursorStrValue = dictionary["next_cursor_str"] as? String{
			this.nextCursorStr = nextCursorStrValue
		}
		if let previousCursorValue = dictionary["previous_cursor"] as? Int{
			this.previousCursor = previousCursorValue
		}
		if let previousCursorStrValue = dictionary["previous_cursor_str"] as? String{
			this.previousCursorStr = previousCursorStrValue
		}
		if let usersArray = dictionary["users"] as? [[String:Any]]{
            let usersItems = List<User>()
			for dic in usersArray{
                let value = User.fromDictionary(dictionary: dic)
				usersItems.append(value)
			}
			this.users = usersItems
		}
		return this
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		dictionary["next_cursor"] = nextCursor
		if nextCursorStr != nil{
			dictionary["next_cursor_str"] = nextCursorStr
		}
		dictionary["previous_cursor"] = previousCursor
		if previousCursorStr != nil{
			dictionary["previous_cursor_str"] = previousCursorStr
		}
		if users.count > 0{
			var dictionaryElements = [[String:Any]]()
			for i in 0 ..< users.count {					dictionaryElements.append(users[i].toDictionary())
			}
			dictionary["users"] = dictionaryElements
		}
		return dictionary
	}
}
