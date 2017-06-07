//
//  ImagesCollectionCell.swift
//  MoneyRank
//
//  Created by eddie kwon on 6/6/17.
//  Copyright © 2017 hallomuze. All rights reserved.
//

import UIKit

class ImagesCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var appImageView: UIImageView!
    
    override func awakeFromNib() {
       
        self.appImageView.backgroundColor = UIColor.lightGray

        self.appImageView.layer.borderWidth = 0.5
        self.appImageView.layer.borderColor = UIColor.lightGray.cgColor
    }
}
