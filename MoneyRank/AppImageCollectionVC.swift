//
//  AppImageCollectionVC.swift
//  MoneyRank
//
//  Created by eddie kwon on 6/6/17.
//  Copyright © 2017 hallomuze. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class AppImageCollectionVC: UICollectionViewController {

    var imageURLs:[String]?
    let cache = NSCache<AnyObject, AnyObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = self.imageURLs?.count {
            return count
        }
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImagesCollectionCell
        
        if let images = self.imageURLs {
            let imageLocation = images[indexPath.row]
            
            self.findCachedImage(imgUrlString: imageLocation, completionHandler: { (image) in
                cell.appImageView.image = image
            })
            //cell.appImageView.imageFromServerURL(urlString: imageLocation)
            
        }
        
        return cell
    }
 
    //IB: flowlayout  &  code: Horizontal,paging
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let height = (kScreenWidth-60) / 2 * kPhoneRatio
        return CGSize(width:self.view.bounds.width / 2  , height:height - 10)
        
    }
    
    func findCachedImage(imgUrlString: String , completionHandler: @escaping (UIImage?) -> Void)      {
        
        guard let imgUrl = URL(string: imgUrlString) else {return   }
        
        let objKey = imgUrl as AnyObject
        
        if self.cache.object(forKey: objKey ) != nil {
            
            if let cachedImage = self.cache.object(forKey: objKey) as? UIImage
            {
                print("cache 이미지 있었음.")
                
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
                        
                        completionHandler(imageFound)
                        self.cache.setObject(imageFound , forKey:objKey )
                    }
                }
                
            }) .resume()
            
        }
    }
 

}
