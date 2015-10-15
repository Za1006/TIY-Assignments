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
//    when need to run several times and not repeating = repeat,while.
//     class Ticket
//    {
//      var winner: Bool
//      var payOut: String
//      private var picks = Set<Int>()
//    when using set<Int>()...use object.insert(aPick); and ticket = Array<Int>(), use ticket.append(aPick)

//
//      init()
//    {
//      winner = false
//      payout = ""
//      for _ in 0...<6
//    {
//      createPick() made a function called pickFound
//    }
//    }
//    }
//    init(picksArray: Array<Int>)
//    {
//       winner = false
//       payout = ""
//       for i in 0..<picksArray.count
//    }
    
}

//
    