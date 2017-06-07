//
//  JsonParser.swift
//  MoneyRank
//
//  Created by eddie kwon on 6/4/17.
//  Copyright © 2017 hallomuze. All rights reserved.
//

 
import UIKit
 
struct BankAppModel{

    public var im_name : String
    public var images  : [imageModel]
    public var summary : String
    public var title : String
    public var category : String?
    
    public var identifier:String
 
    public let cacheForImage = NSCache <AnyObject,AnyObject>()
}

let kLabel:String = "label"
public typealias jsonDic = [String:Any]

extension BankAppModel{
    
    init?(json:[String:Any]){
        
        // step 1 ------------------------------------------
        
        guard let nameJson = json["im:name"] as? [String:Any]  ,
            let summaryJson = json["summary"] as? [String:Any]  ,
            let titleJson = json["title"] as? [String:Any],
            let categoryJson = json["category"] as? [String:Any],
            let imageArrayJson = json["im:image"] as? [Any],
        let idJson  = json["id"] as? [String:Any]
        
            else{
                return nil
        }
        
        // step 2 ------------------------------------------
        
        guard let nameLabel = nameJson[kLabel] as? String ,
            let summaryLabel = summaryJson[kLabel] as? String ,
            let titleLabel = titleJson[kLabel] as? String,
            let categoryAttr = categoryJson["attributes"] as? jsonDic,
            
            
        let idAttributes = idJson["attributes"] as? jsonDic,
        let identifier = idAttributes["im:id"]as? String,
        let categoryName = categoryAttr[kLabel]as? String
            
            else{
                return nil
        }
        
        // parse image array -------------------------------
        
        var imageCollector:[imageModel] = []
        
        for image in imageArrayJson{
            
            if let imageDic = image as? [String:Any] {
                
                if let imgModel = imageModel(json: imageDic){
                    imageCollector.append(imgModel)
                }
            }
            
        }
        
        //summarize  ---------------------------------------
        
        self.im_name = nameLabel
        self.summary = summaryLabel
        self.title = titleLabel
        self.images = imageCollector
        self.identifier = identifier
        self.category = categoryName
        
    }
}

struct imageModel{
    
    public let url:URL
    public let urlString:String
    public let height:CGFloat
    
    
    init?(json:[String:Any]){
        
        guard let  imageLabel = json[kLabel] as? String ,
            let attr = json["attributes"] as? [String:Any] , let height = attr["height"] as? String else {
                return nil
        }
        
        let heightVal : CGFloat? = Double(height).map{ CGFloat($0) }

        self.urlString = imageLabel
        self.url = URL(string: imageLabel)!
        
        guard let heights = heightVal else {
            return nil
        }
        
        self.height = CGFloat( heights  )
    }
}
 
