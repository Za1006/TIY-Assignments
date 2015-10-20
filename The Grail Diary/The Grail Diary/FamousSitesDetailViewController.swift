//
//  FamousSitesDetailViewController.swift
//  The Grail Diary
//
//  Created by Elizabeth Yeh on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class FamousSitesDetailViewController: UIViewController
{
    var place = FamousPlaces?()
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var historyLabel: UILabel!
    
    @IBOutlet weak var attributeLabel: UILabel!
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        nameLabel.text = " Name: " + place!.siteName
        locationLabel.text = "Location: " + place!.siteLocation
        historyLabel.text = "History: " + place!.siteHistory
        attributeLabel.text = "Attribute: " + place!.siteAttribute
    }
    override func didReceiveMemoryWarning()
    {
        
    }

}
