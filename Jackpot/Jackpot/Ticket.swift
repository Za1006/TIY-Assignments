//
//  ticket.swift
//  Jackpot
//
//  Created by Elizabeth Yeh on 10/14/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class tickets
{
    var lottoTicket: Int
    
    init(dictionary: NSDictionary)
    {
        lottoTicket = dictionary["lottoTick"] as! Int
        
    }
}
    