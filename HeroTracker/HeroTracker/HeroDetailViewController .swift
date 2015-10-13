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
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var homeWorld: UILabel!
    @IBOutlet weak var powers: UILabel!
    var hero: Hero?
    
    override func viewDidload()
    {
        super.viewDidLoad()
        nameLabel.text = hero!.name
        homeWorldLabel.text = "from \(hero!.homeWorld)"
        powerLabel.text = 
    }
    
    
    
}

