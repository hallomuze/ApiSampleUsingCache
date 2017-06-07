//
//  FinanceTableViewController.swift
//  MoneyRank
//
//  Created by eddie kwon on 6/3/17.
//  Copyright © 2017 hallomuze. All rights reserved.
//

import UIKit

let kRankHeight:CGFloat = 100

class FinanceTableViewController: UITableViewController {
  
    var appModels:[BankAppModel] = []
     
    let rankCellIdentifier = "RankCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appModels = []
    
        let resultClosure : jsonResultType = {
            
            guard let data = $1 else {
                return
            }
                
            do{
                if let apiDic = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                    
                    if let feed = apiDic["feed"] as? [String:Any] {
                        
                        //array 타입의 entry
                        
                        if let entrySeed = feed["entry"] as? [Any] {    //배열구해오고.
                            
                            for item in entrySeed { //12개 중에 하나의 딕셔너리에 해당함. 예) 0번째에 해당.
                                
                                 if let item = item as? [String:Any]{
                                
                                    if let model = BankAppModel(json: item)  {
                                    
                                        self.appModels.append(model)
                                    }
                                }
                            }
                        } //end of parsing Array.
                        
                        if self.appModels.isEmpty == false {
                            
                            DispatchQueue.main.async {   [unowned self] in
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
                
                
            }catch{
                
                print("errr")
            }
            
        }
        
        
        let urlString = "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json"
 
        APIService.sharedInstance.requestHttp(urlString: urlString, handler: resultClosure)
        
    }
  
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: rankCellIdentifier, for: indexPath) as! RankCell
        
        if self.appModels.isEmpty { return cell }
        
        let model = self.appModels[indexPath.row]
        
        cell.titleLabel?.text = model.title
        cell.rankLabel?.text = "\(indexPath.row)"
        
        if let cate =  model.category {
            cell.categoryLabel?.text = cate
        }
        
        guard let urlString = model.images.last?.urlString else { return cell }
        guard let imgUrl = URL(string: urlString) else {return cell }
        
        
        //image caching ----------
        
        if let image = imgUrl.cachedImage{
            
            cell.appImageView.image = image
          
            
        }else{
            
            imgUrl.fetchImage(completion: { (image) in
                
                guard let visibleCell = self.tableView.cellForRow(at: indexPath) as? RankCell else{
                    return
                }
                
                visibleCell.appImageView.image = image
                
            })
        }
        
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "AppInfoVC") as! AppInfoVC
        
        let model = self.appModels[indexPath.row]
        
        detailVC.identifier = model.identifier
        
        self.navigationController!.pushViewController(detailVC, animated: true)
   
    }
    
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (self.appModels .count)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kRankHeight
    }
 
    

 
}


 
 
