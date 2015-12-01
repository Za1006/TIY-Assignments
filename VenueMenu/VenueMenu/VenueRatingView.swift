//
//  VenueRatingView.swift
//  VenueMenu
//
//  Created by Elizabeth Yeh on 11/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

@objc public protocol VenueRatingViewDelegate
{
    
    func venueRatingView(ratingView: VenueRatingView, didUpdate rating: Float)
    
    optional func venueRatingView(ratingView: VenueRatingView, isUpdating rating: Float)
}

@IBDesignable
public class VenueRatingView: UIView
{
    
    public weak var delegate: VenueRatingViewDelegate?
    
    private var emptyImageViews: [UIImageView] = []
    private var fullImageViews: [UIImageView] = []
    
    @IBInspectable public var emptyImage: UIImage?
        {
           didSet
          {
            for imageView in self.emptyImageViews
            {
                imageView.image = emptyImage
            }
            self.refresh()
          }
    }
    
    @IBInspectable public var fullImage: UIImage?
        {
           didSet
        {
            for imageView in self.fullImageViews
            {
                imageView.image = fullImage
            }
            self.refresh()
        }
    }
    
    var imageContentMode: UIViewContentMode = UIViewContentMode.ScaleAspectFit
    
    @IBInspectable public var minRating: Int = 0
        {
           didSet
          {
            if self.rating < Float(minRating)
            {
                self.rating = Float(minRating)
                self.refresh()
            }
          }
    }
    
    @IBInspectable public var maxRating: Int = 5
        {
           didSet
            {
                let needRefresh = maxRating != oldValue
                if needRefresh
                {
                    self.removeImageViews()
                    self.initImageViews()
                    self.setNeedsLayout()
                    self.refresh()
                }
            }
    }
    @IBInspectable public var minImageSize: CGSize = CGSize(width: 5.0, height: 5.0)
    @IBInspectable public var rating: Float = 0
        {
           didSet
         {
              if rating != oldValue
              {
                self.refresh()
            }
         }
    }
    
    @IBInspectable public var editable: Bool = true
    @IBInspectable public var halfRating: Bool = true
    @IBInspectable public var floatRating: Bool = false
    
    required override public init(frame: CGRect)
    {
        super.init(frame: frame)
        self.initImageViews()
    }

    required public init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.initImageViews()
    }
    
    
    func refresh()
    {
        for i in 0..<self.fullImageViews.count
        {
            let imageView = self.fullImageViews[i]
            
            if self.rating >= Float(i+1)
            {
                imageView.layer.mask = nil
                imageView.hidden = false
            }
            else if self.rating > Float(i) && self.rating < Float(i+1)
            {
                let maskLayer = CALayer()
                maskLayer.frame = CGRectMake(0,0, CGFloat(self.rating - Float(i)) * imageView.frame.size.width, imageView.frame.size.height)
                maskLayer.backgroundColor = UIColor.blackColor().CGColor
                imageView.layer.mask = maskLayer
                imageView.hidden = false
            }
            else
            {
                imageView.layer.mask = nil
                imageView.hidden = true
            }
        }
    }
    
    func sizeForImage(image: UIImage, inSize size:CGSize)->CGSize
    {
        let imageRatio = image.size.width / image.size.height
        let viewRatio = size.width / size.height
        
        if imageRatio < viewRatio
        {
            let scale  = size.height / image.size.height
            let width = scale * image.size.width
            
            return CGSizeMake(width, size.height)
        }
        else
        {
            let scale = size.width / image.size.width
            let height = scale * image.size.height
            
            return CGSizeMake(size.width, height)
        }
    }
    
    override public func layoutSubviews()
    {
        super.layoutSubviews()
        
        if let emptyImage = self.emptyImage
        {
            let desiredImageWidth = self.frame.size.width / CGFloat(self.emptyImageViews.count)
            let maxImageWidth = max(self.minImageSize.width,desiredImageWidth)
            let maxImageHeight = max(self.minImageSize.height, self.frame.size.height)
            let imageViewSize = self.sizeForImage(emptyImage, inSize: CGSizeMake(maxImageWidth, maxImageHeight))
            let imageXOffset = (self.frame.size.width - (imageViewSize.width * CGFloat(self.emptyImageViews.count))) / CGFloat((self.emptyImageViews.count - 1))
            
            for i in 0..<self.maxRating
            {
                let imageFrame = CGRectMake(i==0 ? 0:CGFloat(i)*(imageXOffset+imageViewSize.width), 0, imageViewSize.width, imageViewSize.height)
                var imageView = self.emptyImageViews[i]
                imageView.frame = imageFrame
                
                imageView = self.fullImageViews[i]
                imageView.frame = imageFrame
            }
            self.refresh()
        }
        
    }
    
    func removeImageViews()
    {
        for i in 0..<self.emptyImageViews.count
        {
            var imageView = self.emptyImageViews[i]
            imageView.removeFromSuperview()
            imageView = self.fullImageViews[i]
            imageView.removeFromSuperview()
        }
        self.emptyImageViews.removeAll(keepCapacity: false)
        self.fullImageViews.removeAll(keepCapacity: false)

    }
    
    func initImageViews()
    {
        if self.emptyImageViews.count != 0
        {
            return
        }
        
        for _ in 0..<self.maxRating
        {
            let emptyImageView = UIImageView()
            emptyImageView.contentMode = self.imageContentMode
            emptyImageView.image = self.emptyImage
            self.emptyImageViews.append(emptyImageView)
            self.addSubview(emptyImageView)
            
            let fullImageView = UIImageView()
            fullImageView.contentMode = self.imageContentMode
            fullImageView.image = self.fullImage
            self.fullImageViews.append(fullImageView)
            self.addSubview(fullImageView)
        }
    }
    
//    func handleTouchAtLocation(touchLocation: CGPoint)
//    {
//        if !self.editable
//        {
//            return
//        }
//        
//        var newRating: Float = 0
//        for i in (self.maxRating-1).stride(through: 0, by: -1)
//        {
//            let imageView = self.emptyImageViews[i]
//            if touchLocation.x > imageView.frame.origin.x
//            {
//                // Find touch point in image view
//                let newLocation = imageView.convertPoint(touchLocation, fromView:self)
//                
//                // Find decimal value for float or half rating
//                if imageView.pointInside(newLocation, withEvent: nil) && (self.floatRatings || self.halfRatings)
//                {
//                    let decimalNum = Float(newLocation.x / imageView.frame.size.width)
//                    newRating = Float(i) + decimalNum
//                    if self.halfRatings
//                    {
//                        newRating = Float(i) + (decimalNum > 0.75 ? 1:(decimalNum > 0.25 ? 0.5:0))
//                    }
//                }
//                    // Whole rating
//                else
//                {
//                    newRating = Float(i) + 1.0
//                }
//                break
//            }
//        }
//        
//        // Check min rating
//        self.rating = newRating < Float(self.minRating) ? Float(self.minRating):newRating
//        
//        // Update delegate
//        if let delegate = self.delegate
//        {
//            delegate.venueRatingView?(self, isUpdating: self.rating)
//        }
//    }
//    
//    override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
//    {
//        if let touch = touches.first
//        {
//            let touchLocation = touch.locationInView(self)
//            self.handleTouchAtLocation(touchLocation)
//        }
//    }
//    
//    override public func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
//    {
//        if let touch = touches.first
//        {
//            let touchLocation = touch.locationInView(self)
//            self.handleTouchAtLocation(touchLocation)
//        }
//    }
//    
//    override public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?)
//    {
//        // Update delegate
//        if let delegate = self.delegate
//        {
//            delegate.venueRatingView(self, didUpdate: self.rating)
//        }
//    }

}
