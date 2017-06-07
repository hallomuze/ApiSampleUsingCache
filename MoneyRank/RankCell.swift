//
//  RankCell.swift
//  MoneyRank
//
//  Created by eddie kwon on 6/3/17.
//  Copyright © 2017 hallomuze. All rights reserved.
//

import UIKit
import SDWebImage

class RankCell: UITableViewCell {

    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var appImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.appImageView.layer.cornerRadius = 15
        self.appImageView.layer.borderWidth = 0.5
        self.appImageView.layer.borderColor = UIColor.lightGray.cgColor
        self.appImageView.clipsToBounds = true
    }
 
    public func bindData (_ model: BankAppModel , rank:Int ){
        self.titleLabel?.text = model.title
        self.rankLabel?.text = "\(rank)"
        
        guard let imageUrlString = model.images.last?.urlString else {return }
        self.appImageView.imageFromServerURL(urlString: imageUrlString)
        
    }

}
