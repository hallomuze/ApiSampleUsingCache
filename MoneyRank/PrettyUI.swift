//
//  PrettyUI.swift
//  MoneyRank
//
//  Created by eddie kwon on 6/6/17.
//  Copyright © 2017 hallomuze. All rights reserved.
//

import UIKit

class PrettyUI: NSObject {

    
    class func applyAttrLabelAndGetHeight(aString: String , label aLabel:UILabel , lineSpacing aSpacing: CGFloat, width aWidth:CGFloat) -> CGFloat {
        
        // prepare parameters
        
        let aFont = aLabel.font
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.lineSpacing = aSpacing
        paraStyle.alignment = NSTextAlignment.center
        
        let attrString = NSMutableAttributedString(string: aString)
        let range = NSMakeRange(0, attrString.length)
        
        
        // apply font 폰트 추가
        attrString.addAttribute(NSFontAttributeName, value: aFont, range: range)
        
        // apply line spacing 라인스페이싱
        attrString.addAttribute(NSParagraphStyleAttributeName, value: paraStyle, range: range)
        
        // apply color ( option )  색상 속성 ( 옵션 )
        //attrString.addAttribute(NSBackgroundColorAttributeName, value:UIColor.yellow,  range: NSRange(location: 1, length:3 ))
        
        
        // put everything into aLabel
        aLabel.attributedText = attrString
        aLabel.numberOfLines = 0 //crucial!!  매우 중요.
      
        let myoptions = unsafeBitCast(
            NSStringDrawingOptions.usesLineFragmentOrigin.rawValue |
                NSStringDrawingOptions.usesFontLeading.rawValue, to:
            NSStringDrawingOptions.self )
        let retHeight = attrString.boundingRect(with: CGSize(width:aWidth, height:CGFloat.infinity), options: myoptions, context: nil).height
        
        return retHeight
    }
}

// 너무 잘 동작하는데.
// https://stackoverflow.com/questions/37018916/swift-async-load-image

extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error)
                return
            }
            
            
            DispatchQueue.main.async(execute: { [unowned self] in
                
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }
}

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

extension UIImage{
    
    func grayScale() -> UIImage {
        
        let filter = CIFilter(name: "CIPhotoEffectMono")  //
        
        let ciInput = CIImage(image: self)
        filter?.setValue(ciInput, forKey: "inputImage")
        
        // get output CIImage, render as CGImage first to retain proper UIImage scale
        
        let ciOutput = filter?.outputImage
        let ciContext = CIContext()
        let cgImage = ciContext.createCGImage(ciOutput!, from: (ciOutput?.extent)!)
        
        return UIImage(cgImage: cgImage!)
    }
    
}
