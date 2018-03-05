//
//  BaseEstimationViewController.swift
//  ScrumCards
//
//  Created by Veerachamy, Vimal on 2/6/18.
//  Copyright © 2018 VIMAL KUMAR VEERACHAMY. All rights reserved.
//

import UIKit

class BaseEstimationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    var itemsPerRow: CGFloat = 3
    var items:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.backBarButtonItem?.tintColor = UIColor.white
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (items?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
        
        cell.estimationIndLbl.text = items?[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let estimationDetailVC = storyboard.instantiateViewController(withIdentifier: "EstimationDetailViewController") as! EstimationDetailViewController
        estimationDetailVC.selectedEstPointValue = items?[indexPath.row]
        
        self.navigationController?.pushViewController(estimationDetailVC, animated:true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension BaseEstimationViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return sectionInsets.left
    }
}
