//
//  JackpotTableViewCell.swift
//  Jackpot
//
//  Created by Elizabeth Yeh on 10/14/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class JackpotTableViewCell: UITableViewCell
{

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var numbersLabel: UILabel!
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var payOutLabel: UILabel!

}
