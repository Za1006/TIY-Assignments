//
//  ForecasterCell.swift
//  Forecaster
//
//  Created by Elizabeth Yeh on 10/30/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ForecasterCell: UITableViewCell
{

    @IBOutlet weak var 城市Label: UILabel!
    @IBOutlet weak var 目前的溫度Label: UILabel!
    
    @IBOutlet weak var 摘要Label: UILabel!
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
