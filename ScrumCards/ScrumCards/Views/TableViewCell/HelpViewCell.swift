//
//  HelpViewCell.swift
//  ScrumCards
//
//  Created by Veerachamy, Vimal on 3/8/18.
//  Copyright © 2018 VIMAL KUMAR VEERACHAMY. All rights reserved.
//

import UIKit

class HelpViewCell: UITableViewCell {

    @IBOutlet weak var helpValueLbl: UILabel?;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        self.backgroundColor = UIColor.red
//        self.contentView.layer.cornerRadius = 5
//        self.contentView.layer.masksToBounds = true
        
//        self.layer.shadowColor = self.backgroundColor?.cgColor
//        self.layer.shadowOffset = CGSize(width:0,height: 2.0)
//        self.layer.shadowRadius = 10.0
//        self.layer.shadowOpacity = 1.0
//        self.layer.masksToBounds = false;
//        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
