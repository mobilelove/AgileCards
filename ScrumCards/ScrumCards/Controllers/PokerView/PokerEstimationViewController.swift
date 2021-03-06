//
//  PokerEstimationViewController.swift
//  ScrumCards
//
//  Created by VIMAL KUMAR VEERACHAMY on 2/3/18.
//  Copyright © 2018 VIMAL KUMAR VEERACHAMY. All rights reserved.
//

import UIKit

class PokerEstimationViewController: BaseEstimationViewController {
        
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Poker"
        
        var scrumCardMapping: NSDictionary?
        
        if let scrumCardMappingPath = Bundle.main.path(forResource: "ScrumCardMapping", ofType: "plist") {
            scrumCardMapping = NSDictionary(contentsOfFile: scrumCardMappingPath)
        }
        
        if let estimationValues = scrumCardMapping {
            items = estimationValues.object(forKey: "PokerEstimation") as? [String]
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

