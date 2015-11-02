//
//  ForecastDetailView.swift
//  Forecaster
//
//  Created by Elizabeth Yeh on 10/31/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ForecastDetailViewController: UIViewController
{
    
    var forcast = Forecast!()
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var precipProLabel: UILabel!
    
   
    @IBOutlet weak var apparentTempLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    
    @IBOutlet weak var moonPhaseLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
// MARK: - Detail View
    
    func mapSetup()
    {
        
    }
    
    override func performSegueWithIdentifier(identifier: String, sender: AnyObject?)
    {
            let ForecastDetailVC = self.storyboard?.instantiateViewControllerWithIdentifier("ForecastDetail")as! ForecastDetailViewController
        
        self.navigationController?.pushViewController(ForecastDetailVC, animated: true)
    }
}
