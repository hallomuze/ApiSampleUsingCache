/*
Copyright (c) 2017 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Json4Swift_Base {
	public var im_name : im_name?
	public var im_image : Array<Im:image>?
	public var summary : Summary?
	public var im_price : Im_price?
	public var im_contentType : Im:contentType?
	public var rights : Rights?
	public var title : Title?
	public var link : Link?
	public var id : Id?
	public var im_artist : Im:artist?
	public var category : Category?
	public var im_releaseDate : Im:releaseDate?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let json4Swift_Base_list = Json4Swift_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Json4Swift_Base]
    {
        var models:[Json4Swift_Base] = []
        for item in array
        {
            models.append(Json4Swift_Base(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Json4Swift_Base Instance.
*/
	required public init?(dictionary: NSDictionary) {

		if (dictionary["im:name"] != nil) { im_name = im_name(dictionary: dictionary["im:name"] as! NSDictionary) }
		if (dictionary["im:image"] != nil) { im:image = Im:image.modelsFromDictionaryArray(dictionary["im:image"] as! NSArray) }
		if (dictionary["summary"] != nil) { summary = Summary(dictionary: dictionary["summary"] as! NSDictionary) }
		if (dictionary["im:price"] != nil) { im:price = Im:price(dictionary: dictionary["im:price"] as! NSDictionary) }
		if (dictionary["im:contentType"] != nil) { im:contentType = Im:contentType(dictionary: dictionary["im:contentType"] as! NSDictionary) }
		if (dictionary["rights"] != nil) { rights = Rights(dictionary: dictionary["rights"] as! NSDictionary) }
		if (dictionary["title"] != nil) { title = Title(dictionary: dictionary["title"] as! NSDictionary) }
		if (dictionary["link"] != nil) { link = Link(dictionary: dictionary["link"] as! NSDictionary) }
		if (dictionary["id"] != nil) { id = Id(dictionary: dictionary["id"] as! NSDictionary) }
		if (dictionary["im:artist"] != nil) { im:artist = Im:artist(dictionary: dictionary["im:artist"] as! NSDictionary) }
		if (dictionary["category"] != nil) { category = Category(dictionary: dictionary["category"] as! NSDictionary) }
		if (dictionary["im:releaseDate"] != nil) { im:releaseDate = Im:releaseDate(dictionary: dictionary["im:releaseDate"] as! NSDictionary) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.im_name?.dictionaryRepresentation(), forKey: "im_name")
		dictionary.setValue(self.summary?.dictionaryRepresentation(), forKey: "summary")
		dictionary.setValue(self.im:price?.dictionaryRepresentation(), forKey: "im:price")
		dictionary.setValue(self.im:contentType?.dictionaryRepresentation(), forKey: "im:contentType")
		dictionary.setValue(self.rights?.dictionaryRepresentation(), forKey: "rights")
		dictionary.setValue(self.title?.dictionaryRepresentation(), forKey: "title")
		dictionary.setValue(self.link?.dictionaryRepresentation(), forKey: "link")
		dictionary.setValue(self.id?.dictionaryRepresentation(), forKey: "id")
		dictionary.setValue(self.im:artist?.dictionaryRepresentation(), forKey: "im:artist")
		dictionary.setValue(self.category?.dictionaryRepresentation(), forKey: "category")
		dictionary.setValue(self.im:releaseDate?.dictionaryRepresentation(), forKey: "im:releaseDate")

		return dictionary
	}

}
