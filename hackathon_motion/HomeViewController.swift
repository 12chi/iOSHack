//
//  HomeViewController.swift
//  hackathon_motion
//
//  Created by Chi Nguyen on 3/15/18.
//  Copyright © 2018 Nathan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var HomeMapView: MKMapView!
    @IBOutlet weak var SpinmeLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    var locationManager: CLLocationManager!
    
    var direction: String = ""
    
    var gradientLayer: CAGradientLayer!
    
    @IBAction func stopButton(_ sender: UIButton) {
        locationManager.stopUpdatingHeading()
        print("/////////direction: \(direction)")
    }
    
    func createGradientLayer() {
        view.backgroundColor = UIColor.clear
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(red:0.82, green:0.90, blue:0.96, alpha:1.0).cgColor, UIColor(red:0.31, green:0.51, blue:1.00, alpha:1.0).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createGradientLayer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iconImage.image = UIImage(named: "icons")
        locationManager = CLLocationManager()
        // For use when the app is open & in the background
        //        locationManager.requestAlwaysAuthorization()
        // For use when the app is open
        locationManager.requestWhenInUseAuthorization()
        
        // If location services is enabled get the users location
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
            locationManager.startUpdatingLocation()
            
            /////////////////////////// ***********************
            locationManager.startUpdatingHeading()
        }
        
        HomeMapView.delegate = self
        HomeMapView.showsUserLocation = true
        HomeMapView.userTrackingMode = .follow
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //determining direction
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        let heading = newHeading.magneticHeading
        print("/////////heading: \(heading)")
        if (heading > 0 && heading < 45) || heading > 315  {
            direction = "North"
        } else if heading > 44 && heading < 135 {
            direction = "East"
        } else if heading > 134 && heading < 225 {
            direction = "South"
        } else if heading > 224 && heading < 316 {
            direction = "West"
        }
        print("/////////direction: \(direction)")
    }
    
    // Print out the location to the console
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print(location.coordinate)
        }
    }
    
    // If we have been deined access give the user the option to change it
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            showLocationDisabledPopUp()
        }
    }
    
    // Show the popup to the user if we have been deined access
    func showLocationDisabledPopUp() {
        let alertController = UIAlertController(title: "Background Location Access Disabled",
                                                message: "In order to deliver pizza we need your location",
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destination = segue.destination as! DetailViewController
        
        // calculation direction from core location
        // set to variable before segue
        destination.direction = direction
        print("/////////direction in prepare for segue: \(direction)")
    }

    @IBAction func unwindHome(sender: UIStoryboardSegue) {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
            locationManager.startUpdatingLocation()
            
            /////////////////////////// ***********************
            locationManager.startUpdatingHeading()
        }
    }
}
