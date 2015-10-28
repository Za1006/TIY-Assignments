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


class MapViewController: UIViewController
{
    @IBOutlet weak var mapView: MKMapView!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
//  ask geocoder to find the location of Lakeland instead of providing the coordination
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString("Lakeland, FL", completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            
            if let placemark = placemarks?[0]
            {
                let annotation = MKPointAnnotation()
                annotation.coordinate = (placemark.location?.coordinate)!
                annotation.title = "Lakeland, FL"
                self.mapView.addAnnotation(annotation)
                
            }
        })
        
        
        let tiyOrlando = CLLocationCoordinate2DMake(28.540923, -81.38216)
        let tiyOrlandoAnnotation = MKPointAnnotation()
        tiyOrlandoAnnotation.coordinate = tiyOrlando
//   Creat the pin and tells the pin where it goes
        tiyOrlandoAnnotation.title = "The Iron Yard"
        tiyOrlandoAnnotation.subtitle = "Orlando"
        
        let tiyTampa = CLLocationCoordinate2DMake(27.770068, -82.63642)
        let tiyTampaAnnotation = MKPointAnnotation()
        tiyTampaAnnotation.coordinate = tiyTampa
//   Creat the pin and tells the pin where it goes
        tiyTampaAnnotation.title = "The Iron Yard"
        tiyTampaAnnotation.subtitle = "Tampa"
        let annotations = [tiyOrlandoAnnotation, tiyTampaAnnotation]
        mapView.addAnnotations(annotations)
        mapView.showAnnotations(annotations, animated: true)
        mapView.camera.altitude *= 2
//        zoomed out twice to see both pins *= 2
        
//        let viewRegion = MKCoordinateRegionMakeWithDistance(tiyOrlando, 2000, 2000)
//        mapView.setRegion(viewRegion, animated: true)
        
        let orlandoLocation = CLLocation(coordinate: tiyOrlando, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
        let tampaLocation = CLLocation(coordinate: tiyTampa, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
        let lineOfSightDistance = orlandoLocation.distanceFromLocation(tampaLocation)
        print("distance between \(tiyOrlandoAnnotation.subtitle!) and \(tiyTampaAnnotation.subtitle!):" + String(format: "%.2f", lineOfSightDistance * 0.0062137) + "miles")
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

