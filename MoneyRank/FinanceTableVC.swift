//
//  FinanceTableViewController.swift
//  MoneyRank
//
//  Created by eddie kwon on 6/3/17.
//  Copyright © 2017 hallomuze. All rights reserved.
//

import UIKit

class FinanceTableViewController: UITableViewController {
 
    var appTitles:[String]?
    
    typealias apiResult = (URLResponse? , Data?) -> Void
    
    let rankCellIdentifier = "RankCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appTitles = []
        
        let resultClosure : apiResult = {
            
            if let data = $1 {  //data
                
                do{
                    if let apiDic = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        
                        if let feed = apiDic["feed"] as? [String:Any] {
                            
                            //title, icon
                            
                            if let title = feed["title"] as? [String:Any] ,
                                let   icon = feed["icon"] as? [String:Any] {
                                
                                let finalTitle = title["label"] as? String
                                let finalIcon = icon["label"] as? String
                                print("title:\(finalTitle!) , icon:\(finalIcon!)")
                            }
                            
                            //array 타입의 entryu
                            
                            if let entrySeed = feed["entry"] as? [Any] {    //배열구해오고.
                                
                                for item in entrySeed { //12개 중에 하나의 딕셔너리에 해당함. 예) 0번째에 해당.
                                    
                                    if let item = item as? [String:Any]{ //딕셔너리 타입으로 변환후
                                        
                                        if let item = item["im:name"] as? [String:Any] {   // 첫째 딕리서러ㅣ 가져옴.
                                            
                                            if let name = item["label"] as? String {
                                                
                                                print("what...\(name)")
                                                
                                                self.appTitles?.append(name)
                                                
                                            }
                                        }
                                    }
                                }
                            } //end of parsing Array.
                            print("api done🔥")
                            
                            if self.appTitles?.isEmpty == false {
                                
                                DispatchQueue.global(qos: .userInitiated).async{
                                
                                    DispatchQueue.main.async {
                                
                                    self.tableView.reloadData()
                                    }
                                }
                                
                            }
                        }
                    }
                    
                    
                }catch{
                    
                    print("errr")
                }
                
            } //end of dollar 1
        }
        
        self.requestHttp(resultClosure)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: rankCellIdentifier, for: indexPath) as! RankCell
        //let cell = tableView.dequeueReusableCell(withIdentifier: rankCellIdentifier ) as! RankCell
        
        print ("rororororor ")
        
        if let titles = self.appTitles  {
            
            let title = titles[indexPath.row]
            
            cell.titleLabel?.text = title
            cell.rankLabel?.text = "\(indexPath.row)"
            
            print ("cell.rankLabel?.text is \(cell.rankLabel?.text)")
        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (self.appTitles?.count)!
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  
 
    func requestHttp(_ handler:@escaping apiResult){
        
        let sessionConfiguration = URLSessionConfiguration.default;
        
        let urlString = "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json"
        
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

 
