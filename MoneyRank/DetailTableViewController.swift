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

        
        //self.scro
        //scrollView insets 를 uncheck 하면 스크롤 안됨.헐.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.bindData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        <#code#>
//    }
    
      func bindData ()
    {
        
        guard let model = self.model else{ return }
        
        self.appTitleLabel!.text = model.title
        self.appDescLabel!.text = model.summary
        
        guard let imageUrl = model.images.last?.url else { return }
        print("url:\(imageUrl)")
        self.appImageView.sd_setImage(with: imageUrl , completed: nil)
        
    }

}
