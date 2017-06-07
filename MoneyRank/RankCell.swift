//
//  RankCell.swift
//  MoneyRank
//
//  Created by eddie kwon on 6/3/17.
//  Copyright © 2017 hallomuze. All rights reserved.
//

import UIKit
 

class RankCell: UITableViewCell {

    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.appImageView.layer.cornerRadius = 15
        self.appImageView.layer.borderWidth = 0.5
        self.appImageView.layer.borderColor = UIColor.lightGray.cgColor
        self.appImageView.clipsToBounds = true
        
        self.appImageView.image = "🔍".image().grayScale()
    }
  

}
