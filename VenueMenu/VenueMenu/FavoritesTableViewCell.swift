//
//  VenueTableViewCell.swift
//  VenueMenu
//
//  Created by Elizabeth Yeh on 11/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell
{
    @IBOutlet weak var favoritesLable: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
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
