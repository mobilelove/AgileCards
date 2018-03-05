//
//  CollectionViewCell.swift
//  ScrumCards
//
//  Created by Veerachamy, Vimal on 2/5/18.
//  Copyright © 2018 VIMAL KUMAR VEERACHAMY. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var estimationIndLbl: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = UIColor.init(red: 0.0/255.0, green: 145.0/255.0, blue: 147.0/255.0, alpha: 0.4)
        
        self.layer.cornerRadius = 10.0
        
        self.layer.shadowColor = self.backgroundColor?.cgColor
        self.layer.shadowOffset = CGSize(width:0,height: 2.0)
        self.layer.shadowRadius = 10.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false;
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath

        
    }
    
}
