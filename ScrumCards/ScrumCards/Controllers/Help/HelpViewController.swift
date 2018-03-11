//
//  AboutViewController.swift
//  ScrumCards
//
//  Created by VIMAL KUMAR VEERACHAMY on 2/3/18.
//  Copyright © 2018 VIMAL KUMAR VEERACHAMY. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var helpTableView : UITableView?
    
    var expandedSectionHeaderNumber: Int = -1
    
    var helpSections : Array<Any> = []
    var helpSectionItems : Array<Any> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set Navigation Title
        self.title = "Help"
        
        var mapingInfo : NSDictionary?
        
        if let mappingInfoPath = Bundle.main.path(forResource: "ScrumHelpMapping", ofType: "plist") {
            mapingInfo = NSDictionary(contentsOfFile: mappingInfoPath)
        }
        
        helpSections = mapingInfo?.object(forKey: "SectionTitles") as! Array<Any>
        helpSectionItems = mapingInfo?.object(forKey: "RowItems") as! Array<Any>
        
        self.helpTableView?.register(UINib.init(nibName: "SectionHeaderView", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: "SectionHeaderView")
        
        self.helpTableView?.rowHeight = UITableViewAutomaticDimension
        self.helpTableView?.estimatedRowHeight = 50.0
        
        self.helpTableView?.reloadData()
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if helpSections.count > 0 {
            return helpSections.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (self.expandedSectionHeaderNumber == section) {
            let arrayOfItems = self.helpSectionItems[section] as! NSArray
            return arrayOfItems.count;
        } else {
            return 0;
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionHeaderView") as! SectionHeaderView
        sectionHeaderView.sectionTitle?.text = helpSections[section] as? String
        
        // make headers touchable
        sectionHeaderView.tag = section
        
        let headerTapGesture = UITapGestureRecognizer()
        headerTapGesture.addTarget(self, action: #selector(HelpViewController.sectionHeaderWasTouched(_:)))
        sectionHeaderView.addGestureRecognizer(headerTapGesture)
        
        return sectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    @objc func sectionHeaderWasTouched(_ sender: UITapGestureRecognizer) {
        let headerView = sender.view as! SectionHeaderView
        let section    = headerView.tag
        
        if (self.expandedSectionHeaderNumber == -1) {
            self.expandedSectionHeaderNumber = section
            tableViewExpandSection(section, sectionHeaderView: headerView)
        } else {
            if (self.expandedSectionHeaderNumber == section) {
                tableViewCollapeSection(section, sectionHeaderView: headerView)
            } else {
                tableViewCollapeSection(self.expandedSectionHeaderNumber, sectionHeaderView: headerView)
                tableViewExpandSection(section, sectionHeaderView: headerView)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = helpTableView?.dequeueReusableCell(withIdentifier: "HelpCell", for: indexPath) as! HelpViewCell
    
        let section = self.helpSectionItems[indexPath.section] as! NSArray

        cell.helpValueLbl?.text = section[indexPath.row] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableViewCollapeSection(_ section: Int, sectionHeaderView: SectionHeaderView) {
        let sectionData = self.helpSectionItems[section] as! NSArray
        
        self.expandedSectionHeaderNumber = -1;
        if (sectionData.count == 0) {
            return;
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                sectionHeaderView.sectionImgView?.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(Double.pi)) / 180.0)
            })
            var indexesPath = [IndexPath]()
            for i in 0 ..< sectionData.count {
                let index = IndexPath(row: i, section: section)
                indexesPath.append(index)
            }
            self.helpTableView!.beginUpdates()
            self.helpTableView!.deleteRows(at: indexesPath, with: UITableViewRowAnimation.fade)
            self.helpTableView!.endUpdates()
        }
    }
    
    func tableViewExpandSection(_ section: Int, sectionHeaderView: SectionHeaderView) {
        let sectionData = self.helpSectionItems[section] as! NSArray
        
        if (sectionData.count == 0) {
            self.expandedSectionHeaderNumber = -1;
            return;
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                sectionHeaderView.sectionImgView?.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(Double.pi)) / 180.0)
            })
            var indexesPath = [IndexPath]()
            for i in 0 ..< sectionData.count {
                let index = IndexPath(row: i, section: section)
                indexesPath.append(index)
            }
            self.expandedSectionHeaderNumber = section
            self.helpTableView!.beginUpdates()
            self.helpTableView!.insertRows(at: indexesPath, with: UITableViewRowAnimation.fade)
            self.helpTableView!.endUpdates()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
