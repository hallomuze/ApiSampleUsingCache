//
//  JsonParser.swift
//  MoneyRank
//
//  Created by eddie kwon on 6/4/17.
//  Copyright © 2017 hallomuze. All rights reserved.
//

/*
 
금융 카테고리 무료 앱 순위를 목록으로 보여주세요.
목록에서 사용자가 선택한 앱의 앱 상세 정보를 보여주세요.
과제에 사용되는 API 정보는 아래와 같습니다.

0) https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/
1) https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json
2) https://itunes.apple.com/lookup?id={id}&country=kr

*/

 
import UIKit


struct BankAppModel{

    public var im_name : String
    //public var im_image : Array<Im_image>
    public var images  : [imageModel]
    public var summary : String
//    public var im_price : Im_price?
//    public var im_contentType : Im:contentType?
//    public var rights : Rights?
    public var title : String
//    public var link : Link?
//    public var id : Id?
//    public var im_artist : Im:artist?
    public var category : Category?
    //public var im_releaseDate : Im_releaseDate?
    
    public var identifier:String
 
    public let cacheForImage = NSCache <AnyObject,AnyObject>()
 
//    public var im_price : Im_price?
//    public var im_contentType : Im:contentType?
//    public var rights : Rights?
//    public var title : Title?
//    public var link : Link?
//    public var id : Id?
//    public var im_artist : Im:artist?
//    public var category : Category?
//    public var im_releaseDate : Im:releaseDate?
    
}

let kLabel:String = "label"
public typealias jsonDic = [String:Any]

extension BankAppModel{
    
    init?(json:[String:Any]){
        
        // step 1 ------------------------------------------
        
        guard let nameJson = json["im:name"] as? [String:Any]  ,
            let summaryJson = json["summary"] as? [String:Any]  ,
            let titleJson = json["title"] as? [String:Any],
            let imageArrayJson = json["im:image"] as? [Any],
        let idJson  = json["id"] as? [String:Any]
        
            else{
                return nil
        }
        
        // step 2 ------------------------------------------
        
        guard let nameLabel = nameJson[kLabel] as? String ,
            let summaryLabel = summaryJson[kLabel] as? String ,
            let titleLabel = titleJson[kLabel] as? String,
        
        let idAttributes = idJson["attributes"] as? jsonDic,
        let identifier = idAttributes["im:id"]as? String
            
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



//예외: image type: array type

//모든 타입: label or attribuite
