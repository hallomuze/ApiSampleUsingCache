//
//  DetailTableViewController.swift
//  MoneyRank
//
//  Created by artist on 05/06/2017.
//  Copyright © 2017 hallomuze. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var appMakerLabel: UILabel!
    
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var appPriceLabel: UILabel!
    
    @IBOutlet weak var appDescLabel: UILabel!
    @IBOutlet weak var appDeveloperLabel: UILabel!
    @IBOutlet weak var appCategoryLabel: UILabel!
    
    @IBOutlet weak var appReleaseDataLabel: UILabel!
    
    
    var model:BankAppModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false; //REMOVE TOP INSET
        
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.bindData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
      func bindData ()
    {
        
        guard let model = self.model else{ return }
        
        self.appTitleLabel!.text = model.title
        self.appDescLabel!.text = model.summary
        
        guard let imageUrl = model.images.last?.url else { return }
        print("url:\(imageUrl)")
        self.appImageView.sd_setImage(with: imageUrl , completed: nil)
        
        
        let descHeight:CGFloat = self.heightForView(text: model.summary , font: self.appDescLabel.font , width: self.view.bounds.width)
        
        
        
        
        
    }
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        
        var currHeight:CGFloat!
        
        let label:UILabel = UILabel(frame: CGRect(x:0, y:0, width:width, height:CGFloat.greatestFiniteMagnitude))
        
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        currHeight = label.frame.height
        label.removeFromSuperview()
        
        return currHeight
    }

    
    //view 의 height 는 equal 로 하면 문제 계속 발생함. width 만 동일하게 하고,
    // 나머지 4 left, top, right, left 를 0으로 하면 됨.
}
