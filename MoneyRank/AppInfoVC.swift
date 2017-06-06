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
    
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var descMoreButton: UIButton!
    
    @IBOutlet weak var descFakeLabel: UILabel!
    
    //what's new
    @IBOutlet weak var whatsNewDate: UILabel!
    @IBOutlet weak var whatsNewLabel: UILabel!
    
    @IBOutlet weak var swipableContainerView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var descLabelHeightConstraint: NSLayoutConstraint!
    
    //information
    @IBOutlet weak var developerLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    @IBOutlet weak var updatedLastLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    
    @IBOutlet weak var sizeOfAppLabel: UILabel!
    @IBOutlet weak var langLabel: UILabel!
    var identifier:String?
 
    var jsonResult:apiResult?
    
    func updateUI(_ model:AppDetailModel){
        
        
        DispatchQueue.global(qos: .background).async {
            
            DispatchQueue.main.async {
            
                
                self.titleLabel.text = model.trackName
                self.contentRatingLabel.text = model.contentAdvisoryRating
                
                if let starVal = model.averageUserRatingForCurrentVersion {
                   self.starLabel.text = String(repeating: "⭐️", count: starVal)
                }else{
                    self.starLabel.text = "no star!!"
                }
                self.makerLabel.text = model.artistName
                
                let imageUrl = URL(string:model.artworkUrl60)
                self.thumbImageView.sd_setImage(with: imageUrl , completed: nil)
            
                // What's new
                self.descLabel.text = model.description
                self.whatsNewLabel.text = model.releaseNotes
                self.whatsNewDate.text = model.currentVersionReleaseDate
                
                // Information
                self.developerLabel.text = model.artistName
                self.categoryLabel.text = model.primaryGenreName
                self.updatedLastLabel.text = model.currentVersionReleaseDate
                //self.sizeOfAppLabel.text = model.f
                //self.langLabel.text = model.
                
                let fileSizeAsInt = Int64(model.fileSizeBytes)
                
                let fileSizeWithUnit = ByteCountFormatter.string(fromByteCount:fileSizeAsInt!, countStyle: .file)
                //print("File Size: \(fileSizeWithUnit)")
                self.sizeOfAppLabel.text = "\(fileSizeWithUnit)"
                
                
                self.view.layoutIfNeeded()
                self.view.updateConstraintsIfNeeded()
                //print("url:\(imageUrl)")
                
 
//                let width = self.makerLabel.bounds.size.width
//                let labelHeight = PrettyUI.applyAttrLabelAndGetHeight( aString: model.artistName, label: self.makerLabel, lineSpacing: 3, width: width )
//
//                self.makerLabel.translatesAutoresizingMaskIntoConstraints = false
//                self.descLabelHeightConstraint.constant = labelHeight

                
               
                
                
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
    
//    override func updateViewConstraints() {
//        super.updateViewConstraints()
//        self.view.updateConstraintsIfNeeded()
//        self.view.setNeedsLayout()
//    }
 
    
    func prettify(){
        
        contentRatingLabel.layer.borderColor = UIColor.darkGray.cgColor
        contentRatingLabel.layer.borderWidth = 1
        
        thumbImageView.layer.cornerRadius = 25
        thumbImageView.layer.borderColor = UIColor.lightGray.cgColor
        thumbImageView.layer.borderWidth = 1
        
        
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
                        
                            print("exception :\(error)")
                        }
                    }
            }

            }catch{
                
                 print("exception :\(error)")
            }
        }
    }

    @IBAction func actionMoreDesc(_ sender: UIButton) {
        
        self.stackView.invalidateIntrinsicContentSize()
        //self.widthConstraint.constant = (self.compressed == false) ? 100.0 : 200.0
        //self.compressed = !self.compressed
        self.descLabel.numberOfLines = 0
        self.view.layoutIfNeeded()
        
        //self.view.setNeedsUpdateConstraints()
        //self.view.updateConstraintsIfNeeded()
        self.descMoreButton.isHidden = true
        
        UIView.animate(withDuration: 0.2,
                       delay: 0.0,
                       usingSpringWithDamping: 0.0,
                       initialSpringVelocity: 10.0,
                       options: .curveLinear,
                       animations: { () -> Void in
                        
                        
        }, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
