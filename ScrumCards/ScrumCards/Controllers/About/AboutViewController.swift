//
//  AboutViewController.swift
//  ScrumCards
//
//  Created by VIMAL KUMAR VEERACHAMY on 2/3/18.
//  Copyright © 2018 VIMAL KUMAR VEERACHAMY. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var helpTableView : UITableView?
    
    var scrumHelpMappings: NSArray?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set Navigation Title
        self.title = "Help"
        
        if let scrumHelpMappingsPath = Bundle.main.path(forResource: "ScrumHelpMapping", ofType: "plist") {
            scrumHelpMappings = NSArray(contentsOfFile: scrumHelpMappingsPath)
        }
        
        self.helpTableView?.rowHeight = UITableViewAutomaticDimension
        self.helpTableView?.estimatedRowHeight = 50.0
        
        self.helpTableView?.reloadData()
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (scrumHelpMappings?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = helpTableView?.dequeueReusableCell(withIdentifier: "HelpCell", for: indexPath) as! HelpViewCell
        
        let keys: NSDictionary = scrumHelpMappings?.object(at: indexPath.row) as! NSDictionary
        
        let keyName : String = keys.allKeys.first as! String
        
        cell.helpValueLbl?.text = keyName
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
