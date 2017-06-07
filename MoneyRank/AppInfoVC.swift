//
//  AppInfoVC.swift
//  MoneyRank
//
//  Created by eddie kwon on 6/5/17.
//  Copyright © 2017 hallomuze. All rights reserved.
//

import UIKit

let kScreenSize = UIScreen.main.bounds
let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height
let kPhoneRatio = UIScreen.main.bounds.height / UIScreen.main.bounds.width

class AppInfoVC: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var makerLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var contentRatingLabel: UILabel!
    @IBOutlet weak var starContainerView: UIView!
    
    //screenshots
    @IBOutlet weak var swipableContainerView: UIView!
    @IBOutlet weak var imageContainerHeightConstraint: NSLayoutConstraint!
    
    //Description
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var descMoreButton: UIButton!
    
    //what's new
    @IBOutlet weak var whatsNewDate: UILabel!
    @IBOutlet weak var whatsNewLabel: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var descLabelHeightConstraint: NSLayoutConstraint!
    
    //information
    @IBOutlet weak var developerLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var updatedLastLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var sizeOfAppLabel: UILabel!
    @IBOutlet weak var langLabel: UILabel!
    
    //bottom info
    @IBOutlet weak var sellerSiteLabel: UILabel!
    
    @IBOutlet weak var copyrightLabel: UILabel!
    
    var identifier:String?
    var jsonResult:jsonResultType?
    var model:AppDetailModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.automaticallyAdjustsScrollViewInsets = false
         
        guard let id = self.identifier else {
            print("network error or no idenfitier found")
            return
        }

        swipableContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerHeightConstraint.constant = (kScreenWidth-60) / 2 * kPhoneRatio
         
        self.prettify()
        
        let url : String  = "https://itunes.apple.com/lookup?id=\(id)&country=kr"
        
        DispatchQueue.global(qos: .background).async {

            APIService.sharedInstance.requestHttp(urlString: url) { [unowned self] (response, data) in
                 
                guard let data = data else {
                    return
                }
                
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                            
                        if let topmost = json["results"] as? [Any] ,let topArr =  topmost.first as? jsonDic {
                            
                            do{
                                let appModel =  try AppDetailModel(json: topArr)
                                self.model = appModel
                                self.updateUI(appModel)
                            
                            }catch{
                            
                                print("JSONSerialization exception :\(error)")
                            }
                        }
                    }

                }catch{
                    
                     print("exception :\(error)")
                }
            }
        }
    }

    // MARK - updateUI
    func updateUI(_ model:AppDetailModel){
        
            DispatchQueue.main.async { [unowned self] in
                
                self.titleLabel.text = model.trackName
                self.contentRatingLabel.text = model.contentAdvisoryRating
                
                self.makerLabel.text = model.artistName
                
                //self.thumbImageView.imageFromServerURL(urlString: model.artworkUrl60 )
                
                self.findCachedImage(imgUrlString: model.artworkUrl100, completionHandler: { (imageFound ) in
                    self.thumbImageView.image = imageFound
                })
                
                // What's new
                self.descLabel.text = model.description
                self.whatsNewLabel.text = model.releaseNotes
                self.whatsNewDate.text = model.currentVersionReleaseDate
                
                // Information
                self.developerLabel.text = model.artistName
                self.categoryLabel.text = model.primaryGenreName
                self.updatedLastLabel.text = model.currentVersionReleaseDate
                self.versionLabel.text = model.version
                
                if let langcode =  model.languageCodesISO2A  {
                    let firstLang = langcode.first
                    self.langLabel.text = firstLang
                }
                if let fileSizeAsInt = Int64(model.fileSizeBytes) {
                   
                    let fileSizeWithUnit = ByteCountFormatter.string(fromByteCount:fileSizeAsInt, countStyle: .file)
                    self.sizeOfAppLabel.text = "\(fileSizeWithUnit)"
                }
                
                if let starVal = model.averageUserRatingForCurrentVersion {
                         self.fillStarContainer(rating: starVal)
                }
            
                
                
                //self.copyrightLabel.text = model.sellerName
                
                for vc in self.childViewControllers{
                 
                    if vc is AppImageCollectionVC {
                        
                        let collectionVC = vc as! AppImageCollectionVC
                        collectionVC.imageURLs = model.screenshotUrls
                        collectionVC.collectionView?.reloadData()
                        
                    }
                }
        }
    }

    func prettify(){
        contentRatingLabel.layer.borderColor = UIColor.darkGray.cgColor
        contentRatingLabel.layer.borderWidth = 1
        thumbImageView.layer.cornerRadius = 25
        thumbImageView.layer.borderColor = UIColor.lightGray.cgColor
        thumbImageView.layer.borderWidth = 1
    }
    
    // MARK: actionMoreDesc
    
    @IBAction func actionMoreDesc(_ sender: UIButton) {
        
        self.stackView.invalidateIntrinsicContentSize()
        
        self.descLabel.numberOfLines = 0
        self.view.layoutIfNeeded()
        
        self.descMoreButton.isHidden = true
        
    }
    
    // MARK: star rating
    
    func fillStarContainer(rating:Int){
  
        //Stack View 생성
        let stackView   = UIStackView(  )
        stackView.axis  = UILayoutConstraintAxis.horizontal
        stackView.distribution  = UIStackViewDistribution.equalSpacing
        stackView.alignment = UIStackViewAlignment.leading
        stackView.spacing   = 2.0
        
        let kImageViewSize:CGFloat = 13.0
        
        //star image 생성
        for _ in 0..<5{
            
            let imageView = UIImageView()
            imageView.backgroundColor = UIColor.blue
            imageView.heightAnchor.constraint(equalToConstant: kImageViewSize).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: kImageViewSize).isActive = true
            imageView.image = "⭐️".image().grayScale()
            
            stackView.addArrangedSubview(imageView)
        }
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        self.starContainerView.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalToConstant:  15*5 ).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 15 ).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.starContainerView.centerYAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.starContainerView.leftAnchor).isActive = true
        
        for (idx,view) in stackView.subviews.enumerated(){
            if view is UIImageView{
                let img = view as! UIImageView
                
                print("asdfasdf")
                UIView.animate(withDuration: 1.5,
                               delay: 2.1,
                               usingSpringWithDamping: 0.0,
                               initialSpringVelocity: 1.0,
                               options: .curveLinear,
                               animations: { () -> Void in
                                
                                if idx <= rating {
                                    img.image = "⭐️".image()
                                }
                                
                }, completion: nil)
            }
        }
    } //end of fillStar func
    
    
    let cache = NSCache<AnyObject, AnyObject>()
    
    func findCachedImage(imgUrlString: String , completionHandler: @escaping (UIImage?) -> Void)      {
        
        guard let imgUrl = URL(string: imgUrlString) else {return   }
        
        //var returnImage:UIImage = UIImage()
        
        let objKey = imgUrl as AnyObject
        
        if self.cache.object(forKey: objKey ) != nil {
            
            if let cachedImage = self.cache.object(forKey: objKey) as? UIImage
            {
                print("cache 이미지 있었음.")
                //returnImage = cachedImage
                completionHandler(cachedImage)
            }
            
        }else{
            
            URLSession.shared.downloadTask(with: imgUrl, completionHandler: { (url, response, error ) in
                if (error != nil) {
                    return
                }
                
                guard let data = try? Data(contentsOf: imgUrl) else {
                    return
                }
                
                DispatchQueue.main.async{ [unowned self] in
                    
                    if let imageFound = UIImage(data:data) {
                        
                        //returnImage = imageFound
                        completionHandler(imageFound)
                        self.cache.setObject(imageFound , forKey:objKey )
                    }
                }
                
            }) .resume()
            
        }
    }

    @IBAction func goWebsite(_ sender: UIControl) {
        
        if let sellerUrlStr = self.model?.sellerUrl {
            
            if let newUrl = URL(string: sellerUrlStr ){
                
                UIApplication.shared.openURL(newUrl)
                               
            }
        }
        
    }
    @IBOutlet weak var websiteMovingControl: UIControl!
  
}
