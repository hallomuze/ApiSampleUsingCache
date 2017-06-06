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
    @IBOutlet weak var makerLabel: UILabel!
    @IBOutlet weak var contentRatingLabel: UILabel!
    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    //var appModel:AppDetailModel?
    @IBOutlet weak var whatsNewLabel: UILabel!
    @IBOutlet weak var swipableContainerView: UIView!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var descLabelHeightConstraint: NSLayoutConstraint!
    var identifier:String?
 
    var jsonResult:apiResult?
    
    func updateUI(_ model:AppDetailModel){
        
        
        DispatchQueue.global(qos: .background).async {
            
            DispatchQueue.main.async {
            
                self.titleLabel.text = model.trackName
                self.contentRatingLabel.text = model.contentAdvisoryRating
                
                self.makerLabel.text = model.artistName
                
                let imageUrl = URL(string:model.artworkUrl60)
                self.thumbImageView.sd_setImage(with: imageUrl , completed: nil)
            
                self.descLabel.text = model.description
                self.whatsNewLabel.text = model.releaseNotes
                
                self.view.layoutIfNeeded()
                self.view.updateConstraintsIfNeeded()
                //print("url:\(imageUrl)")
                
 
//                let width = self.makerLabel.bounds.size.width
//                let labelHeight = PrettyUI.applyAttrLabelAndGetHeight( aString: model.artistName, label: self.makerLabel, lineSpacing: 3, width: width )
//
//                self.makerLabel.translatesAutoresizingMaskIntoConstraints = false
//                self.descLabelHeightConstraint.constant = labelHeight

                
                UIView.animate(withDuration: 3.0,
                                           delay: 0.0,
                                           usingSpringWithDamping: 0.3,
                                           initialSpringVelocity: 10.0,
                                           options: .curveLinear,
                                           animations: { () -> Void in
                                            self.stackView.invalidateIntrinsicContentSize()
                                            //self.widthConstraint.constant = (self.compressed == false) ? 100.0 : 200.0
                                            //self.compressed = !self.compressed
                                            self.makerLabel.numberOfLines = 0
                                            self.view.layoutIfNeeded()
                                            
                                            self.view.setNeedsUpdateConstraints()
                                            self.view.updateConstraintsIfNeeded()
                                            
                }, completion: nil)
                
                
                for vc in self.childViewControllers{
                     //print (view )
                    if vc is AppImageCollectionVC {
                        
                       let collectionVC = vc as! AppImageCollectionVC
                        collectionVC.imageURLs = model.screenshotUrls
                        collectionVC.collectionView?.reloadData()
                        
                    }
                }
                
                

            }
        }
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        self.view.updateConstraintsIfNeeded()
        self.view.setNeedsLayout()
    }
//    -(void)updateViewConstraints {
//    [super updateViewConstraints];
//    lbExplain.preferredMaxLayoutWidth = self.view.bounds.size.width - 40;
//    }
    
    func prettify(){
        
        contentRatingLabel.layer.borderColor = UIColor.black.cgColor
        contentRatingLabel.layer.borderWidth = 1
        
        thumbImageView.layer.cornerRadius = 50
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.automaticallyAdjustsScrollViewInsets = false
    
        debugPrint("id is\(self.identifier)")
        
        guard let id = self.identifier else {
            
            return
        }

        self.prettify()
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
