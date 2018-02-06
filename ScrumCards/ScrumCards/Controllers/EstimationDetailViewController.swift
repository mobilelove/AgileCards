//
//  EstimationDetailViewController.swift
//  ScrumCards
//
//  Created by Veerachamy, Vimal on 2/6/18.
//  Copyright © 2018 VIMAL KUMAR VEERACHAMY. All rights reserved.
//

import UIKit

class EstimationDetailViewController: UIViewController {

    @IBOutlet weak var selectedEstPointValLbl: UILabel!
    @IBOutlet weak var topEstPointLbl: UILabel!
    @IBOutlet weak var bottomEstPointLbl: UILabel!
    
    var selectedEstPointValue : String! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize selected estimation value
        selectedEstPointValLbl?.text = selectedEstPointValue!
        topEstPointLbl?.text = selectedEstPointValue!
        bottomEstPointLbl?.text = selectedEstPointValue
        
        //Add UIView Animate for estimation label
        selectedEstPointValLbl.alpha = 0
        topEstPointLbl.alpha = 0
        bottomEstPointLbl.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0.2, options: [.curveEaseInOut],
                       animations: {
                        self.selectedEstPointValLbl.alpha = 1
                        self.topEstPointLbl.alpha = 1
                        self.bottomEstPointLbl.alpha = 1
        },
                       completion: nil
        )
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
