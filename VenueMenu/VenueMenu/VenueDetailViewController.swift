//
//  VenueDetailViewController.swift
//  VenueMenu
//
//  Created by Elizabeth Yeh on 11/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit

class VenueDetailViewController: UIViewController
    
{
    @IBOutlet weak var liveLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    @IBOutlet weak var venueRatingView: VenueRatingView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.venueRatingView.emptyImage = UIImage(named: "Star-Empty")
        self.venueRatingView.fullImage = UIImage(named: "Star-Full")
        
//        self.venueRatingView.delegate = self
        self.venueRatingView.contentMode = UIViewContentMode.ScaleAspectFit
        self.venueRatingView.maxRating = 5
        self.venueRatingView.minRating = 1
        self.venueRatingView.rating = 2.5
        self.venueRatingView.halfRating = true
        self.venueRatingView.editable = true
        self.venueRatingView.floatRating = false
        
        self.liveLabel.text = NSString(format: "%.2f", self.venueRatingView.rating) as String
        self.updatedLabel.text = NSString(format: "%.2f", self.venueRatingView.rating) as String
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func veneuRatingView(ratingView: VenueRatingView, isUpdating rating:Float)
//    {
//        self.liveLabel.text = NSString(format: "%.2f", self.veneuRatingView.rating) as String
//    }
//    
//    func veneuRatingView(ratingView: VenueRatingView, didUpdate rating: Float)
//    {
//        self.updatedLabel.text = NSString(format: "%.2f", self.veneuRatingView.rating) as String
//    }


}
