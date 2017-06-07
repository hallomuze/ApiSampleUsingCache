//
//  PrettyUI.swift
//  MoneyRank
//
//  Created by eddie kwon on 6/6/17.
//  Copyright © 2017 hallomuze. All rights reserved.
//

import UIKit

class Storage{  //이미지 캐시용
    
    let makeBox: UIView = {
        let view = UIView()
        return view
    }()
    
    let dataCache = NSCache<AnyObject, AnyObject>()
    
    static let shared = Storage()
    
    private init(){
        
        dataCache.name = "image cache"
        dataCache.countLimit = 20
        dataCache.totalCostLimit = 10*1024*1024  //10MB
    }
}

extension URL{
    
    typealias imageCompletion = (UIImage) -> Void
 
    var cachedImage:UIImage?{
        
        let cacheKey = self.absoluteString as AnyObject
        return Storage.shared.dataCache.object(forKey: cacheKey ) as? UIImage
    }
    
    func fetchImage(completion: @escaping imageCompletion){
        
        let task = URLSession.shared.dataTask(with: self) { (data, response, error) in
            
            if error == nil {
     
                if let  data = data,
                    let image = UIImage(data: data) {

                    let cacheKey = self.absoluteString as AnyObject
                
                    Storage.shared.dataCache.setObject(image, forKey: cacheKey , cost: data.count )
                    
                    DispatchQueue.main.async{
                        
                        let image = UIImage(data: data)
                        completion(image!)
                    }
                }
                
            }
        }
        
        task.resume()
        
    }
    
}


//string to image 확장
extension String {
    
    func image() -> UIImage {
        
        let size = CGSize(width: 30, height: 30)
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        UIColor.white.set()
        let rect = CGRect(origin: CGPoint.zero, size: size)
        UIRectFill(CGRect(origin: CGPoint.zero, size: size))
        (self as NSString).draw(in: rect, withAttributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 30)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}

//gray filter 구현
extension UIImage{
    
    func grayScale() -> UIImage {
        
        let filter = CIFilter(name: "CIPhotoEffectMono")
        
        let ciSource = CIImage(image: self)
        filter?.setValue(ciSource, forKey: "inputImage")
        
        let ciOutput = filter?.outputImage
        let ciContext = CIContext()
        let cgImage = ciContext.createCGImage(ciOutput!, from: (ciOutput?.extent)!)
        
        return UIImage(cgImage: cgImage!)
    }
    
}
