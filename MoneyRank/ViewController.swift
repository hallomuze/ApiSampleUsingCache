//
//  ViewController.swift
//  MoneyRank
//
//  Created by eddie kwon on 6/2/17.
//  Copyright © 2017 hallomuze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

//    var encodeString = "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json"
//    var apiURI = URL(string: encodeString)
//    
//    let apiData:Data? = Data(contentsOf: apiURI! )
//    
//    
//    if let apiData = apiData{
//      var result = NSString(data: apiData, encoding: NSUTF8StringEncoding)!
//      
//      print(result)
//    }
    
    
    let sessionConfiguration = URLSessionConfiguration.default;
    
    let urlString = "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json"
    
    //"https://itunes.apple.com/search?term=jimmy+buffett"
    
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
    
    let sessionTask = urlSession.dataTask(with: request) {
      (data, response, error) in
    
      
      if let data = data {
        let sString = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        //print(sString)
        
        do{
        
        
          if let apiDic = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
          
            if let feed = apiDic["feed"] as? [String:Any] {
 
              if let title = feed["title"] as? [String:Any] ,
                let   icon = feed["icon"] as? [String:Any] {
                
                let finalTitle = title["label"] as? String
                let finalIcon = icon["label"] as? String
                print("title:\(finalTitle!) , icon:\(finalIcon!)")
                
              }

              

            }
            

            
          }
          
        
        }catch{
          
          print("errr")
        }
        
        
      } else {
        print("Data is nil")
      }
      
      //handler(response, data)
    }
    
    sessionTask.resume()
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

