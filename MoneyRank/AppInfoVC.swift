//
//  AppInfoVC.swift
//  MoneyRank
//
//  Created by eddie kwon on 6/5/17.
//  Copyright © 2017 hallomuze. All rights reserved.
//

import UIKit

class AppInfoVC: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentRatingLabel: UILabel!
    
    //var appModel:AppDetailModel?
    
    
    var identifier:String?
 
    var jsonResult:apiResult?
    
    func updateUI(_ model:AppDetailModel){
        
        
        DispatchQueue.global(qos: .background).async {
            
            DispatchQueue.main.async {
            
                self.titleLabel.text = model.trackName
                self.contentRatingLabel.text = model.contentAdvisoryRating
            }
        }
    }
    
    
    func prettify(){
        
        contentRatingLabel.layer.borderColor = UIColor.black.cgColor
        contentRatingLabel.layer.borderWidth = 1
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.prettify()
        
        self.automaticallyAdjustsScrollViewInsets = false
    
        print("id is\(self.identifier)")
        
        guard let id = self.identifier else {
            
            return
        }
        let url : String  = "https://itunes.apple.com/lookup?id=\(id)&country=kr"
        
        APIService.sharedInstance.requestHttp(urlString: url) { (response, data) in
     
            //debugPrint(data)
            
            guard let data = data else {
                return
            }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        
                    if let topmost = json["results"] as? [Any] ,let topArr =  topmost.first as? jsonDic {
                        
                        do{
                         
                            let appModel =  try AppDetailModel(json: topArr)
                            self.updateUI(appModel)
                        
                        }catch{
                        
                            print("err\(error)")
                        }
                        
                       // debugPrint(topmost)
                        
                       
                    }
            }

            }catch{
                
                 print("err\(error)")
                
            }
                        
 
            
        }
            
         
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
