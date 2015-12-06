//
//  PopoverViewController.swift
//  CarFinder
//
//  Created by Elizabeth Yeh on 12/5/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreLocation

class PopoverViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate
{
    
    @IBOutlet weak var addLocation: UIButton!
    @IBOutlet weak var locationTextField: UITextField!
    
    var delegate: PopoverViewControllerDelegate?
    
    var locationString: String = ""
    var locations = [Location]()
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()


    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureLocationManager()
        addLocation.enabled = false
        locationTextField.becomeFirstResponder()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    MARK: UITextField Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if locationTextField.text != ""
        {
            locationString = textField.text!
            textField.resignFirstResponder()
            locationManager.startUpdatingLocation()
            
            rc = true
        }
        return rc
    }


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
                addLocation.enabled = true
            }
        }
    }

    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse
        {
            addLocation.enabled = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print(error.localizedDescription)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        geocoder.reverseGeocodeLocation(location!, completionHandler: {(placemark: [CLPlacemark]?, error: NSError?) -> Void in
            
            if error != nil
            {
                print(error?.localizedDescription)
            }
            else
            {
                self.locationManager.stopUpdatingLocation()
                let name = self.locationString
                let lat = location?.coordinate.latitude
                let lng = location?.coordinate.longitude
                let aLocation = Location(name: name, lat: lat!, lng: lng!)
                self.locations.append(aLocation)
                self.delegate?.locationWasParked(aLocation)
                
            }
        })
    }
    @IBAction func addLocationButtonTapped(sender: UIButton)
    {
        locationString = locationTextField.text!
        locationManager.startUpdatingLocation()
    }
    
    
    
    
}
