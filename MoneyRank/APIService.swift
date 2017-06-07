//
//  APIService.swift
//  MoneyRank
//
//  Created by eddie kwon on 6/5/17.
//  Copyright © 2017 hallomuze. All rights reserved.
//

import UIKit

public typealias jsonResultType = (URLResponse? , Data?) -> Void


public class APIService: NSObject {

    static let sharedInstance = APIService()
    
    private override init(){
    
    }
    
    public func requestHttp(urlString : String , handler:@escaping jsonResultType){
        
        let sessionConfiguration = URLSessionConfiguration.default
        
        guard let encodeString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else{
            return
        }
        
        guard let url = URL(string: encodeString) else {
            return
        }
        
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        
        let urlSession = URLSession(
            configuration:sessionConfiguration, delegate: nil, delegateQueue: nil)
        
        let sessionTask = urlSession.dataTask(with:request){
            (data,response,error) in
            
            handler(response,data)
        }
        
        sessionTask.resume()
        
    }
    
    //참고 특정query 파싱: https://xho95.github.io/ios/framework/foundation/nsurl/2016/06/02/Parsing-a-NSURL-value.html
    
    // https://grokswift.com/building-urls/
    
    /*
    public func requestMultipleItem(queryString :String , handler:@escaping jsonResultType){
        
        
//        func createURLWithComponents(date: NSDate) -> NSURL? {
//            // create "https://api.nasa.gov/planetary/apod" URL using NSURLComponents
//            let urlComponents = NSURLComponents()
//            urlComponents.scheme = "https";
//            urlComponents.host = "itunes.apple.com";
//            urlComponents.path = "/kr/rss/topfreeapplications";
//            
//            // add params
//            
//             let limitQuery = NSURLQueryItem(name: "limit", value: "50")
//            let genreQuery = NSURLQueryItem(name: "genre", value: "6015")
//            let jsonQuery = NSURLQueryItem(name: "json", value: "")
//            urlComponents.queryItems = [limitQuery, genreQuery, jsonQuery]
//            
//            return urlComponents.URL
//        }
        
        
//        let urlComponents = URLComponents() // base URL components of the web service
//        let session: URLSession // shared session for interacting with the web service
//        
//        var searchURLComponents = urlComponents
//        searchURLComponents.path = "/genre"
//        searchURLComponents.queryItems = [URLQueryItem(name: "6015", value: queryString)]
//        let searchURL = searchURLComponents.url!
        

        
        let urlString = "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json"

        
        
        let sessionConfig = URLSessionConfiguration.default
        
        guard let encodeStr = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
            return
        }
        
        guard let url = URL(string:encodeStr) else {
            return
        }
        
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        
        let urlSession = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        
        
        let sessionTask = urlSession.dataTask(with: request) { (data, response, error) in
            
            
            
            var bankApps: [BankAppModel] = []
            
            guard let data = data else {
                return
            }

            
            do{
                if let apiDic = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                    
                    if let feed = apiDic["feed"] as? [String:Any] {
                        
                        //array 타입의 entry
//                        if let entrySeed = feed["entry"] as? [Any] {    //배열구해오고.
//                         
//                            for case let item in entrySeed{
//                               
//                                if let model = BankAppModel(json: item as! [String : Any])  {
//                                    
//                                    bankApps.append(model)
//                                }
//                            }
//                        }
                        
                        
                        if let entrySeed = feed["entry"] as? [Any] {    //배열구해오고.
                            
                            for item in entrySeed { //12개 중에 하나의 딕셔너리에 해당함. 예) 0번째에 해당.
                                
                                if let item = item as? [String:Any]{
                                    
                                    if let model = BankAppModel(json: item)  {
                                        
                                         bankApps.append(model)
                                        
                                    }
                                }
                                
                            }
                        } //end of parsing Array.
                        
                    }
                }
                
                
            }catch{
                
                print("errr")
            }

            
            
            
            
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                
                
                for case let result in json["results"] {
                    if let restaurant = Restaurant(json: result) {
                        restaurants.append(restaurant)
                    }
                }
            }

            
            
            
            
            handler(response,data)
        }
        
        sessionTask.resume()
        
    }
    
    */
    
    
    
}
