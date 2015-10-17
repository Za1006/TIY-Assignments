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
    var winner = Bool()
    var payOut: String
    private var picks = Set<Int>()
    
    init()
    {
        winner = false
        payOut = ""
        for _ in 0..<6
        {
            tappedAndAdd()
        }
    }
    init(picksArray: Array<Int>)
    {
        winner = false
        payOut = ""
        for i in 0..<picksArray.count
        {
            picks.insert(picksArray[i])
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
    func description() -> String
    {
        var numbers = ""
        for pick in picks.sort()
        {
            numbers = numbers + "\(pick)"
        }
        return numbers
    }
    func picksArry() -> [Int]
    {
        var picksArray = [Int]()
        
        for pick in picks.sort()
        {
            picksArray.append(pick)
        }
        return picksArray
    }
    
    func compareWithTicket(anotherTicket: JackpotTicket)
    {
        let anotherTicketPicks = anotherTicket.picksArray()
        var matchCount = 0
        for aPossiblePick in anotherTicketPicks
        {
            if picks.contains(aPossiblePick)
            {
                matchCount++

            }

        }
        switch matchCount
        {
        case 3:
            
            winner = true
            payOut = "$1"
            
        case 4:
            
            winner = true
            payOut = "$5"
            
        case 5:
            
            winner = true
            payOut = "$20"
            
        case 6:
            
            winner = true
            payOut = "$100"
            
        default:
            
            winner = false
            payOut = ""
            
            
        }

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
    