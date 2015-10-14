//
//  ticket.swift
//  Jackpot
//
//  Created by Elizabeth Yeh on 10/14/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class JackpotTicket
{
    var ticket = Array<Int>()
    
    init()
    {
        for _ in 1...6
        {
            tappedAndAdd()
        }
    }
    func tappedAndAdd()
    {
        var pickFound = false
        repeat
        {
          let aPick = Int(arc4random() % 53 + 1)
          if !ticket.contains(aPick)
        {
           ticket.append(aPick)
           pickFound = true
        }
        
        } while !pickFound
    }
    
    
}

    