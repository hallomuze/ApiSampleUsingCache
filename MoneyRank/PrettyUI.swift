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
