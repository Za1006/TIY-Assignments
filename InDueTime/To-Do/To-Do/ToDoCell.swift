//
//  ToDoCell.swift
//  To-Do
//
//  Created by Elizabeth Yeh on 10/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell
{
    
    @IBOutlet weak var `switch`: UISwitch!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var titleTextField: UITextField!

    

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
