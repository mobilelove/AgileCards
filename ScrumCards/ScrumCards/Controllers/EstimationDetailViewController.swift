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
        
        selectedEstPointValLbl?.text = selectedEstPointValue!
        topEstPointLbl?.text = selectedEstPointValue!
        bottomEstPointLbl?.text = selectedEstPointValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
