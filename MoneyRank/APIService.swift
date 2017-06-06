//
//  APIService.swift
//  MoneyRank
//
//  Created by eddie kwon on 6/5/17.
//  Copyright © 2017 hallomuze. All rights reserved.
//

import UIKit

public typealias apiResult = (URLResponse? , Data?) -> Void


public class APIService: NSObject {

    static let sharedInstance = APIService()
    
    private override init(){
    
    }
    
    public func requestHttp(urlString : String , handler:@escaping apiResult){
        
        let sessionConfiguration = URLSessionConfiguration.default
        
        //let urlString = "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json"
        
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
}
