//
//  SiteNameCell.swift
//  The Grail Diary
//
//  Created by Elizabeth Yeh on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class SiteNameCell: UITableViewCell
{

    @IBOutlet weak var nameOfSite: UILabel!
    
    @IBOutlet weak var locationOfSite: UILabel!
    
    @IBOutlet weak var historyOfSite: UILabel!
    
    @IBOutlet weak var attributeOfSite: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
