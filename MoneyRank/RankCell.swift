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
        // Initialization code
        self.selectionStyle = .none
        self.appImageView.layer.cornerRadius = 15
        self.appImageView.layer.borderWidth = 0.5
        self.appImageView.layer.borderColor = UIColor.lightGray.cgColor

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func bindData (_ model: BankAppModel , rank:Int ){
        self.titleLabel?.text = model.title
        self.rankLabel?.text = "\(rank)"
        
        guard let imageUrl = model.images.last?.url else { return }
        //print("url:\(imageUrl)")
        self.appImageView.sd_setImage(with: imageUrl , completed: nil)
        
    }

}
