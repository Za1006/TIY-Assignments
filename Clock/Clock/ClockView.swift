//
//  ClockView.swift
//  Clock
//
//  Created by Elizabeth Yeh on 11/17/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

let borderWidth: CGFloat = 2
let borderAlpha: CGFloat = 1.0
let digitOffset: CGFloat = 10
let graduationOffset: CGFloat = 10
let graduationLength: CGFloat = 5.0
let graduationWidth: CGFloat = 1.0


@IBDesignable
class ClockView: UIView
{
    var animationTimer: CADisplayLink?
    
    var timezone: NSTimeZone? {
        didSet {
            animationTimer = CADisplayLink(target: self, selector: "timerFired:")
            animationTimer!.frameInterval = 8
            
            animationTimer!.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
        }
    }
    
    var time: NSDate?
    var seconds: Int = 0
    var minutes: Int = 0
    var hours: Int = 0
    
    var boundsCenter: CGPoint
    let clockBgColor = UIColor.blackColor()
    let borderColor = UIColor.whiteColor()
    let digitColor = UIColor.whiteColor()
    var digitFont: UIFont
    
    override init(frame: CGRect)
    {
        digitFont = UIFont()
        boundsCenter = CGPoint()
        super.init(frame: frame)
        let fontSize = 8.0 + frame.size.width/50.0
        digitFont = UIFont.systemFontOfSize(fontSize)
        boundsCenter = CGPoint(x: bounds.width/2.0, y: bounds.height/2.0)
        self.backgroundColor = UIColor.clearColor()
        
    }

    required init?(coder aDecoder: NSCoder)
    {
        digitFont = UIFont()
        boundsCenter = CGPoint()
        super.init(coder: aDecoder)
        let fontSize = 8.0 + frame.size.width/50.0
        digitFont = UIFont.systemFontOfSize(fontSize)
        boundsCenter = CGPoint(x: bounds.width/2.0, y: bounds.height/2.0)
        self.backgroundColor = UIColor.clearColor()
    }
    
//    CGPoint = single point on the screen. Hardmode, change let to var for background colors.
    
    
    func secondsHandPosition() -> CGPoint
    {
        let secondsAsRadians = Float(Double(seconds) / 60.0 * 2.0 * M_PI - M_PI_2)
        let handRandius = CGFloat(frame.size.width / 3.2)
        return CGPoint(x: handRandius * CGFloat(cosf(secondsAsRadians)) + boundsCenter.x, y: handRandius * CGFloat(sinf(secondsAsRadians)) + boundsCenter.y)
        
    }
    
    func minutesHandPosition() -> CGPoint
    {
        let minutesAsRadians = Float(Double(minutes) / 60.0 * 2.0 * M_PI - M_PI_2)
        let handRandius = CGFloat(frame.size.width / 3.6)
        return CGPoint(x: handRandius * CGFloat(cosf(minutesAsRadians)) + boundsCenter.x, y: handRandius * CGFloat(sinf(minutesAsRadians)) + boundsCenter.y)
    }
    
    func hourHandPosition() -> CGPoint
    {
        let halfClock = Double(hours) + Double(minutes) / 60.0
        let hourAsRadians = Float(halfClock / 12.0 * 2.0 * M_PI - M_PI_2)
        let handRandius = CGFloat(frame.size.width / 4.2)
        return CGPoint(x: handRandius * CGFloat(cosf(hourAsRadians)) + boundsCenter.x, y: handRandius * CGFloat(sinf(hourAsRadians)) + boundsCenter.y)
    }

    override func drawRect(rect: CGRect)
    {
//  clock face
        let cxt = UIGraphicsGetCurrentContext()
        CGContextAddEllipseInRect(cxt, rect)
        CGContextSetFillColorWithColor(cxt, clockBgColor.CGColor)
        CGContextFillPath(cxt)
        
//  clock's center
        
        var radius: CGFloat = 6.0
        let center2 = CGRect(x: boundsCenter.x - radius, y: boundsCenter.y - radius, width: radius * 2, height: radius * 2)
        CGContextAddEllipseInRect(cxt, center2)
        CGContextSetFillColorWithColor(cxt, digitColor.CGColor)
        CGContextFillPath(cxt)
        
        
//  colock's border around the clock
        CGContextAddEllipseInRect(cxt, CGRect(x: rect.origin.x + borderWidth/2, y: rect.origin.y + borderWidth/2, width: rect.size.width - borderWidth, height: rect.size.height - borderWidth))
        CGContextSetStrokeColorWithColor(cxt, borderColor.CGColor)
        CGContextSetLineWidth(cxt, borderWidth)
        CGContextStrokePath(cxt)
        
        
//    most view have a drawRect func. cxt = context. Draw a circle in the rectangle and set the color to CGColor. Fill in the circle with particular color = CGContextFillPath. CGContextStrokePath = using the properties above that as a guide.
        

//  numerals
        
        let center = CGPoint(x: rect.size.width/2.0, y: rect.size.height/2.0)
        let markingDistanceFromCenter = rect.size.width/2.0 - digitFont.lineHeight / 4.0 - 15 + digitOffset
        let offset = 4
        
        for i in 0..<12
        {
            let hourString: String
            if i + 1 < 10
            {
                hourString = "\(i + 1)"
            }
            else
            {
                hourString = "\(i + 1)"
            }
            
            let labelX = center.x + (markingDistanceFromCenter - digitFont.lineHeight / 2.0) * CGFloat(cos((M_PI / 180) * Double(i + offset) * 30 + M_PI))
            let labelY = center.y - 1 * (markingDistanceFromCenter - digitFont.lineHeight / 2.0) * CGFloat(sin((M_PI / 180) * Double(i + offset) * 30))
            hourString.drawInRect(CGRect(x: labelX - digitFont.lineHeight / 2.0, y: labelY - digitFont.lineHeight / 2.0, width: digitFont.lineHeight, height: digitFont.lineHeight), withAttributes: [NSForegroundColorAttributeName: digitColor, NSFontAttributeName: digitFont])
        
        
    }
        
//   second hand
        let secHandPos = secondsHandPosition()
        CGContextSetStrokeColorWithColor(cxt, UIColor.redColor().CGColor)
        CGContextBeginPath(cxt)
        CGContextMoveToPoint(cxt, boundsCenter.x, boundsCenter.y)
        CGContextSetLineWidth(cxt, 1.0)
        CGContextAddLineToPoint(cxt, secHandPos.x, secHandPos.y)
        CGContextStrokePath(cxt)
        

//    minute hand
        let minHandPos = minutesHandPosition()
        CGContextSetStrokeColorWithColor(cxt, digitColor.CGColor)
        CGContextBeginPath(cxt)
        CGContextMoveToPoint(cxt, boundsCenter.x, boundsCenter.y)
        CGContextSetLineWidth(cxt, 4.0)
        CGContextAddLineToPoint(cxt, minHandPos.x, minHandPos.y)
        CGContextStrokePath(cxt)
        
        
//    hour hand
       let hourHandPos = hourHandPosition()
        CGContextSetStrokeColorWithColor(cxt, digitColor.CGColor)
        CGContextBeginPath(cxt)
        CGContextMoveToPoint(cxt, boundsCenter.x, boundsCenter.y)
        CGContextSetLineWidth(cxt, 4.0)
        CGContextAddLineToPoint(cxt, hourHandPos.x, hourHandPos.y)
        CGContextStrokePath(cxt)
        
        
//    second hand center
        radius = 3.0
        let center3 = CGRect(x: boundsCenter.x - radius, y: boundsCenter.y - radius, width: radius * 2, height: radius * 2)
        CGContextAddEllipseInRect(cxt, center3)
        CGContextSetFillColorWithColor(cxt, UIColor.redColor().CGColor)
        CGContextFillPath(cxt)
        
        

  }
  
    
    func timerFired(sender: AnyObject)
    {
        time = NSDate()
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        calendar?.timeZone = timezone!
        let timeComponents = calendar?.components([.Hour, .Minute, .Second], fromDate: time!)
        hours = (timeComponents?.hour)!
        minutes = (timeComponents?.minute)!
        seconds = (timeComponents?.second)!
        
        setNeedsDisplay()
        
    }
    
    
}
