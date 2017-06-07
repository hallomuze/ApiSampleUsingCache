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
 
            guard let imgUrl = URL(string: imageLocation) else {return cell }
            
            //image caching ----------
            
            if let image = imgUrl.cachedImage{
                
                cell.appImageView.image = image
                
                
            }else{
                
                imgUrl.fetchImage(completion: { (image) in
                    
                    if let visibleCell = self.collectionView?.cellForItem(at: indexPath) as? ImagesCollectionCell   {
                  
                        visibleCell.appImageView.image = image
                    }
                    
                })
            }
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
}
