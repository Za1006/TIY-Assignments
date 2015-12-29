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



class MapDetailViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate
{
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var dropAPinButton: UIButton!
    
    var locations = [Location]()
    var login = false
    var pins = [Pin]()
    var locationString: String = ""
    
//    var delegate: MapDetailViewControllerDelegate?



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
        mapView.delegate = self
        configureLocationManager()
        
        if pins.count > 0
        {
            showLoadedPins()
        }
        

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    


    // MARK: - Navigation
    
    func  configureLocationManager()
    {
        if CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Denied && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Restricted
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.NotDetermined
            {
                locationManager.requestWhenInUseAuthorization()
            }
            else
            {
                dropAPinButton.enabled = true
            }
        }
    }
    
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse
        {
            dropAPinButton.enabled = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        geocoder.reverseGeocodeLocation(location!, completionHandler: {(placemark: [CLPlacemark]?, error: NSError?) -> Void in
            
            if error != nil
            {
                print(error?.localizedDescription)
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false

            }
            else
            {
                self.locationManager.stopUpdatingLocation()
                self.updateMapView(placemark!)
                
                
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
            }
        })
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print(error.localizedDescription)
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
    
    @IBAction func dropAPinButton(sender: UIButton)
    {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        locationManager.startUpdatingLocation()

    }
    
    @IBAction func cancelButtonTapped(sender: UIButton)
    {
        
        print("cleared")
        let query = PFQuery(className:"Pin")
        query.findObjectsInBackgroundWithBlock({ (results : [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                
                for result in results! {
                    result.deleteInBackground()
                }
            }
        })
        pins.removeAll()
        mapView.removeAnnotations(mapView.annotations)
        mapView.removeOverlays(mapView.overlays)
        
        dropAPinButton.enabled = true
        
    }
    
    func updateMapView(placemarks: [CLPlacemark])
    {
        switch pins.count
        {
        case 0:
            location1?.coordinate; placemarks[0].location!.coordinate
            location1?.title; "parked car"
            
            let pin = Pin(lat: location1!.coordinate.latitude, lng: location1!.coordinate.longitude, name: location1!.title)
            pins.append(pin)
            
            showLoadedPins()
            
        case 1:
            location2?.coordinate; placemarks[0].location!.coordinate
            location2?.title; "current location"
            
            let pin = Pin(lat: location2!.coordinate.latitude, lng: location2!.coordinate.longitude, name: location2!.title)
            pins.append(pin)
            
            showLoadedPins()
            
        default: print("error")
        }
    }
    
    func showLoadedPins()
    {
        let annotations = pinsToAnnotations()
        
        if pins.count == 2
        {
            dropAPinButton.enabled = false
            
        }
        
        mapView.removeAnnotations(mapView.annotations)
        
        self.mapView.showAnnotations(annotations, animated: true)
        self.mapView.camera.altitude *= 2
    }
    
    func pinsToAnnotations() -> [MKPointAnnotation]
    {
        var annotations = [MKPointAnnotation]()
        
        for pin in pins
        {
            let annotation = MKPointAnnotation()
            annotation.coordinate.longitude = pin.lng
            annotation.coordinate.latitude = pin.lat
            annotation.title = pin.name
            
            print(pin.name, pin.lng, pin.lat, "was loaded")
            
            annotations.append(annotation)
        }
        return annotations
    }
    
    func saveMapData()
    {
        
        let mapData = NSKeyedArchiver.archivedDataWithRootObject(locations)
                NSUserDefaults.standardUserDefaults().setObject(mapData, forKey: kLocationsKey)
        
        parsePin["lat"] = locations.last
        parsePin["lng"] = locations.last
        parsePin["title"] = locations
        
        parsePin.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success)
            {
                print("saved ")
            }
            else
            {
                print("save failed")
            }
        }
    }
    
    func loginData()
    {
        if let data = NSUserDefaults.standardUserDefaults().objectForKey(kLocationsKey) as? NSData
        {
            if let savedLocations = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [Location]
            {
                locations = savedLocations
                view.reloadInputViews()
            }
        }
    }
    
    

}
