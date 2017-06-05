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
    
    typealias apiResult = (URLResponse? , Data?) -> Void
    
    let rankCellIdentifier = "RankCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appModels = []
        
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
                                    
                                     if let item = item as? [String:Any]{
                                    
                                        if let model = BankAppModel(json: item)  {
                                        
                                            self.appModels.append(model)
                                    
                                        }
                                    }
                                    
                                }
                            } //end of parsing Array.
                            print("api done🔥")
                            
                            if self.appModels.isEmpty == false {
                                
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
        
        if self.appModels.isEmpty { return cell }
        
        let model = self.appModels[indexPath.row]
        
        cell.bindData(model, rank: indexPath.row)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = self.storyboard!.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
 
        if self.appModels.isEmpty { return  }
        
        let model = self.appModels[indexPath.row]
        //detailVC.bindData(model, rank: indexPath.row)
        
        
        detailVC.model = model
        self.navigationController!.pushViewController(detailVC, animated: true)
        print("something")
 
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

/*
 
 애플에서 JSON 처리법
 
 https://developer.apple.com/swift/blog/?id=37
 
 
 How to use IBInspectable to adjust values in Interface Builder
 https://www.hackingwithswift.com/example-code/uikit/how-to-use-ibinspectable-to-adjust-values-in-interface-builder
 
 디버깅팁:
 http://ryanipete.com/blog/ios/swift/objective-c/uidebugginginformationoverlay/
 
 imageView 에 블러처리
 https://stackoverflow.com/questions/5084845/how-to-set-the-opacity-alpha-of-a-uiimage
 
 
 비동기 로딩:
 
 http://blog.saltfactory.net/async-upload-url-image-using-gcd/
 
 
 
self.scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
self.scrollView.center = self.view.center
self.scrollView.contentMode = .scaleAspectFit

self.scrollView.delegate = self
self.scrollView.minimumZoomScale = 0.5
self.scrollView.maximumZoomScale = 5.0
self.scrollView.zoomScale = 1.0
self.scrollView.showsHorizontalScrollIndicator = true
self.scrollView.showsVerticalScrollIndicator = true
self.scrollView.alwaysBounceVertical = true
self.scrollView.alwaysBounceHorizontal = true
self.scrollView.bounces = true
self.scrollView.bouncesZoom = true
self.scrollView.clipsToBounds = true
self.scrollView.flashScrollIndicators()
self.imageView.image = UIImage(named: "offline")
self.imageView.center = self.scrollView.center

self.scrollView.contentSize = self.imageView.bounds.size
self.scrollView.autoresizingMask = [UIViewAutoresizing.flexibleWidth,UIViewAutoresizing.flexibleHeight]

self.scrollView.addSubview(self.imageView)
self.view.addSubview(self.scrollView)

func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return self.imageView
}

func scrollViewDidZoom(_ scrollView: UIScrollView) {
    
    let imageViewSize = self.imageView.frame.size
    let scrollViewSize = self.scrollView.bounds.size
    
    let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
    let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
    
    self.scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
}
*/
 
 
