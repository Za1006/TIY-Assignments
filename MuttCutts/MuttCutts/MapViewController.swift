//
//  ViewController.swift
//  MuttCutts
//
//  Created by Elizabeth Yeh on 10/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol MapPopoverViewControllerDelegate
{
    func CityWasChosen(chosenCity: String)
}


class MapViewController: UIViewController, UIPopoverControllerDelegate
{
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func addCityButton(sender: UIBarButtonItem)
    {
        
    }
    
    var annotation = [MKPointAnnotation]()
    let geocoder = CLGeocoder()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        func geocoder(location: String)
        {
            geocoder.geocodeAddressString(location, completionHandler:
            {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            
            if let placemark = placemarks?[0]
            {
                let annotation = MKPointAnnotation()
                annotation.coordinate = (placemark.location?.coordinate)!
                annotation.title = location
                self.mapView.addAnnotation(annotation)
                
            }
                
        })
        
    func didReceiveMemoryWarning()
        {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
        {
            if segue.identifier == "ShowMapPopoverSegue"
            {
                let destVC = segue.destinationViewController as!
                destVC.popoverPresentationController?.delegate = self
                destVC.delegate = self
                destVC.preferredContentSize = CGSizeMake(220, 100)
            }
        }
        func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) ->  UIModalPresentationStyle
        {
            return .None
        }

    }
  }
}