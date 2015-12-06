//
//  MapViewViewController.swift
//  CarFinder
//
//  Created by Elizabeth Yeh on 12/5/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

let kLocationsKey = "locations"

protocol PopoverViewControllerDelegate
{
    func locationWasParked(location: Location)
}

class MapDetailViewController: UIViewController,PopoverViewControllerDelegate, UIPopoverPresentationControllerDelegate, CLLocationManagerDelegate, MKMapViewDelegate
{
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var addPin: UIBarButtonItem!
    
    var locations = [Location]()

    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    var distance: CLLocationDistance?
    var parsePin = PFObject(className: "Pin")
    var annotations = [MKPointAnnotation]()

    
    var location1: Location?
    var location2: Location?
    var location1Coordinates = CLLocationCoordinate2DMake(0,0)
    var location2Coordinates = CLLocationCoordinate2DMake(0,0)
    var location1Annotation = MKPointAnnotation()
    var location2Annotation = MKPointAnnotation()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowPopoverSegue"
        {
            let destVC = segue.destinationViewController as! PopoverViewController
            destVC.popoverPresentationController?.delegate = self
            destVC.delegate = self
            destVC.preferredContentSize = CGSizeMake(200.0, 80.0)
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .None
    }
    
    func locationWasParked(location: Location)
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        
        locations.append(location)
        if locations.count == 1
        {
            location1 = location
            let viewRegion = MKCoordinateRegionMakeWithDistance(location1!.coordinate, 2000, 2000)
            mapView.setRegion(viewRegion, animated: true)
        }
        else if locations.count == 2
        {
            location2 = location
            mapLocations(location1!, location2: location2!)
            pinLocations(location1!, location2: location2!)
        }
        else
        {
            locations.removeAll()
            location1 = location
            locations.append(location)
        }
    }
    
    func mapLocations(location1: Location, location2: Location)
    {
        location1Coordinates = CLLocationCoordinate2DMake(location1.lat, location1.lng)
        location1Annotation = MKPointAnnotation()
        location1Annotation.coordinate = location1Coordinates
        location1Annotation.title = location1.name
        
        location2Coordinates = CLLocationCoordinate2DMake(location2.lat,location2.lng)
        location2Annotation = MKPointAnnotation()
        location2Annotation.coordinate = location2Coordinates
        location2Annotation.title = location2.name
        
        let annotations = [location1Annotation,location2Annotation]
        mapView.addAnnotations(annotations)
        mapView.showAnnotations(annotations, animated: true)
        // zoom out enough to show the annotations
        mapView.camera.altitude *= 2
    }
    
    func pinLocations(location1: Location, location2: Location)
    {
        let loc1 = CLLocation(coordinate: location1Coordinates, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
        let loc2 = CLLocation(coordinate: location2Coordinates, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
        let lineOfSightDistance = loc1.distanceFromLocation(loc2)
        print("distance between \(location1Annotation.title!) and \(location2Annotation.title!): " + String(format: "%.2f", lineOfSightDistance * 0.00062137) + " miles")
      
    }
    
    
//     func loginData()
//      {
//        if let data = NSUserDefaults.standardUserDefaults().objectForKey(kLocationsKey) as? NSData
//        {
//            if let savedLocations = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [Location]
//            {
//                locations = savedLocations
//                view.reloadInputViews()
//            }
//        }
//      }
    
    func saveMapData()
    {
                let mapData = NSKeyedArchiver.archivedDataWithRootObject(locations)
                NSUserDefaults.standardUserDefaults().setObject(mapData, forKey: kLocationsKey)
        

//        parsePin["lat"] = locations.last
//        parsePin["lng"] = locations.last
////        parsePin["title"] = locations.name
//        parsePin.saveInBackgroundWithBlock {
//            (success: Bool, error: NSError?) -> Void in
//            if (success) {
//                print("saved ")
//            } else {
//                print("save failed")
//            }
//        }
    }
    

}
