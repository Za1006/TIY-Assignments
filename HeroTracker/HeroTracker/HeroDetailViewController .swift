//
//  HeroDetailViewController .swift
//  HeroTracker
//
//  Created by Elizabeth Yeh on 10/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class HeroDetailViewController: UIViewController
{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var homeWorldLabel: UILabel!
    @IBOutlet weak var powersLabel: UILabel!
    var hero: Hero?
    
    override func viewDidLoad()
    {
    
     super.viewDidLoad()
    
        nameLabel.text = hero!.name
        homeWorldLabel.text = "from \(hero!.homeWorld)"
        powersLabel.text = hero?.powers
        let f = NSDateFormatter()
        f.dateStyle = NSDateFormatterStyle.ShortStyle
    }
    override func didReceiveMemoryWarning()
    {
        
    }
    
    
}

