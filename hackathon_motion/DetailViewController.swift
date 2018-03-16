//
//  DetailViewController.swift
//  hackathon_motion
//
//

//
//  DetailViewController.swift
//  CoreMotionDemo
//
//  Created by Eli Byers on 7/7/17.
//  Copyright © 2017 Eli Byers. All rights reserved.
//

import UIKit
import CoreMotion
import CoreLocation
import MapKit
import AVFoundation

class DetailViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    let north = [
        ["name": "Seattle", "country": "United States", "population": "3,439,809", "food_dishes":"Seattle Dog, Ginger Beer", "climate": "Warm-summer Mediterranean climate", "languages": "English", "image": "seattle", "longitude":"-122.332071", "latitude":"47.60621", "sound":"1020"],
        ["name": "Vancouver", "country": "Canada", "population": "603,000", "food_dishes":"JapaDog, Salmon Candy", "climate": "Oceanic climate", "languages": "French, English", "image": "vancouver", "longitude":"-123.120738", "latitude":"49.282729", "sound":"1021"],
        ["name": "Quebec City", "country": "Canada", "population": "538,238", "food_dishes":"Poutine, Tarte au sucre", "climate": "Humid continental climate", "languages": "French, English", "image": "quebec", "longitude":"-73.549136", "latitude":"52.939916", "sound":"1022"],
        ["name": "San Francisco", "country": "United States of America", "population": "870,887", "food_dishes":"Mission-Style Burrito, Joe’s Special", "climate": "Warm-summer Mediterranean climate", "languages": "English", "image": "sf", "longitude":"-122.419416", "latitude":"37.77493", "sound":"1023"],
        ["name": "Anchorage", "country": "United States of America", "population": "291,826", "food_dishes":"Grilled Salmon, Reindeer Dogs", "climate": "Subarctic climate ", "languages": "English", "image": "anchorage", "longitude":"-122.419416", "latitude":"37.77493", "sound":"1024"]
    ]
    let east = [
        ["name": "Hong Kong", "country": "People's Republic of China", "population": "7,409,800", "food_dishes":"Dim Sum, Put chai ko", "climate": "Humid subtropical climate ", "languages": "Chinese, English", "image": "hk", "longitude":"114.109497", "latitude":"22.396428", "sound":"1025"],
        ["name": "Tokyo", "country": "State of Japan", "population": "420,076", "food_dishes":"Misonikomi-Udon, Goheimochi", "climate": "Humid subtropical climate ", "languages": "Japanese", "image": "tokyo", "longitude":"139.691706", "latitude":"35.689488", "sound":"1026"],
        ["name": "Seoul", "country": "Republic of Korea", "population": "25,600,000", "food_dishes":"Gukbap, ukgaejang", "climate": "Humid continental climate", "languages": "Korean", "image": "seoul", "longitude":"126.977969", "latitude":"37.566535", "sound":"1027"],
        ["name": "Manila", "country": "Republic of the Philippines", "population": "1,780,148", "food_dishes":"Bicol express, Halo-Halo", "climate": "Tropical savanna climate", "languages": "Tagalog", "image": "manila", "longitude":"120.98422", "latitude":"14.599512", "sound":"1028"],
        ["name": "Kuala Lumpur", "country": "Malaysia", "population": "7,200,000", "food_dishes":"Nasi Lemak, Ais Kacang", "climate": "Equatorial", "languages": "Malay, English", "image": "kl", "longitude":"101.686855", "latitude":"3.139003", "sound":"1029"]
    ]
    
    let west = [
        ["name": "Berlin", "country": "Federal Republic of Germany", "population": "3,711,930", "food_dishes":"Berliner Weisse, Schrippe", "climate": "Maritime temperate climate ", "languages": "German", "image": "berlin", "longitude":"13.404954", "latitude":"52.520007", "sound":"1030"],
        ["name": "Paris", "country": "French Republic", "population": "2,206,488", "food_dishes":"Le Paris-Brest, Le Croque Monsieur", "climate": "Oceanic climate", "languages": "French", "image": "paris", "longitude":"2.352222", "latitude":"48.856614", "sound":"1031"],
        ["name": "London", "country": "United Kingdom", "population": "8,787,892", "food_dishes":"Fish and Chips, ", "climate": "Temperate oceanic climate ", "languages": "English", "image": "london", "longitude":"-0.127758", "latitude":"51.507351", "sound":"1032"],
        ["name": "Rome", "country": "Italian Republic", "population": "4,357,041", "food_dishes":"Saltimbocca alla Romana, Fettuccine al Burro", "climate": "Mediterranean climate", "languages": "Italian", "image": "rome", "longitude":"12.496366", "latitude":"41.902784", "sound":"1033"],
        ["name": "Helsinki", "country": "Republic of Finland", "population": "1,470,552", "food_dishes":"Kaalikääryleet,Hernekeitto", "climate": "Humid continental climate", "languages": "Finnish", "image": "helsinki", "longitude":"24.938379", "latitude":"60.169856", "sound":"1034"]
    ]
    
    let south = [
        ["name": "Rio de Janeiro", "country": "Federative Republic of Brazil ", "population": "7,456,682", "food_dishes":"", "climate": "", "languages": "Portuguese", "image": "rio", "longitude":"-43.182365", "latitude":"-22.908333", "sound":"1035"],
        ["name": "Mexico City", "country": "United Mexican States", "population": "8,918,653", "food_dishes":"Tortas de Tamales, Gorditas", "climate": "Subtropical highland climate", "languages": "Spanish", "image": "mc", "longitude":"-99.133209", "latitude":"19.432608", "sound":"1036"],
        ["name": "Buenos Aires", "country": "Argentine Republic", "population": "13,591,863", "food_dishes":"Asados, Chimichurri", "climate": "Humid subtropical climate", "languages": "Spanish", "image": "ba", "longitude":"‎-58.381592", "latitude":"-34.603722", "sound":"1026"],
        ["name": "Santiago", "country": "Chile", "population": "7,314,176", "food_dishes":"Pastel de Choclo, Cazuela", "climate": "Semi-arid climate", "languages": "Spanish", "image": "santiago", "longitude":"-70.673676", "latitude":"‎-33.447487", "sound":"1027"],
        ["name": "Panama City", "country": "Panama", "population": "880,691", "food_dishes":"Plantains,Hojaldras", "climate": "Tropical savanna climate", "languages": "Spanish", "image": "pc", "longitude":"‎-79.516670", "latitude":"‎8.983333", "sound":"1025"]
    ]
    
    
    // map location of new city
    @IBOutlet weak var cityMapView: MKMapView!
    
    // direction set by prepare segue
  
    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    
    @IBOutlet weak var climateLabel: UILabel!
    @IBOutlet weak var food_dishesLabel: UILabel!
    
    @IBOutlet weak var shakeDirLabel: UILabel!
    
    @IBOutlet weak var popupBack: UIView!
   
    
    func displayData (city: [String:String]) {
        // call map api with city
        
        if let nameUW = city["name"] {
          cityLabel.text = "\(nameUW)"
        }
        else {
           cityLabel.text = "San Jose"
        }
        if let countryUW = city["country"] {
            countryLabel.text = "\(countryUW)"
        }
        else {
            countryLabel.text = ""
        }
        if let foodUW = city["food_dishes"] {
            food_dishesLabel.text = "popular food: \(foodUW)"
        }
        else {
            food_dishesLabel.text = ""
        }
        
        if let climateUW = city["climate"] {
            climateLabel.text = "climate: \(climateUW)"
        }
        else {
           climateLabel.text = ""
        }
        if let imgUW = city["image"] {
            photoView.image = UIImage(named: "\(imgUW)")
        }
        else {
            photoView.image = UIImage(named: "paris")
        }
        if let latUW = city["latitude"] {
            if let latNum = Double(latUW) {
                lattitude = latNum
            }
        }
        if let longUW = city["longitude"] {
            if let longNum = Double(longUW) {
                longitude = longNum
            }
        }
        
    }
    
    var locationManager: CLLocationManager!
    var motionManager = CMMotionManager()
    let opQueue = OperationQueue()
    var magnetometerData: CMMagnetometerData?
    var x: Double = 0
    var y: Double = 0
    var z: Double = 0
    var nums: [Double] = []
    var heading: Double = 0
    var currentCity:String = "San Jose"
    var direction: String?
    var lattitude: Double = 37.375523571344786
    var longitude: Double = -121.91028230501422
    var country: String = ""
    var location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 37.375523571344786, longitude: -121.91028230501422)
    
//    func updateMap(city: [String:String]) {
//        /////////// update long & lat
//        initialLocation = CLLocation(latitude: lattitude, longitude: longitude)
//        location = CLLocationCoordinate2D(latitude: lattitude,
//                                          longitude: longitude)
//                let span = MKCoordinateSpanMake(0.05, 0.05)
//                let region = MKCoordinateRegion(center: location, span: span)
//                cityMapView.setRegion(region, animated: true)
//
//        if let cityUW = cityLabel.text {
//            currentCity = cityUW
//        }
//        if let countryUW = countryLabel.text {
//            country = countryUW
//        }
//
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = location
//        annotation.title = currentCity
//        annotation.subtitle = country
//        cityMapView.addAnnotation(annotation)
//
//        let arearadius: CLLocationDistance = 10000000
//                 //this 7000 gets a far range
//                centerMap(location: initialLocation)
//
//        //        shakeDirLabel.text = "Shake phone to view another city \(direction) of here"
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("/////////direction in view did load: \(direction)")
        let c = newCity(quad: direction!)
        print ("------new city: ", c)
        displayData(city: c)
        
        locationManager = CLLocationManager()
        
        // For use when the app is open & in the background
        locationManager.requestAlwaysAuthorization()
        
        // For use when the app is open
        //locationManager.requestWhenInUseAuthorization()
        
        // If location services is enabled get the users location
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
            locationManager.startUpdatingLocation()
            
        }
        location = CLLocationCoordinate2D(latitude: lattitude,
                                              longitude: longitude)
        
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        cityMapView.setRegion(region, animated: true)
        
        //3
        if let cityUW = cityLabel.text {
            currentCity = cityUW
        }
        if let countryUW = countryLabel.text {
            country = countryUW
        }
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = currentCity
        annotation.subtitle = country
        cityMapView.addAnnotation(annotation)
//
        centerMap(location: initialLocation)
 
    }
    
    lazy var initialLocation = CLLocation(latitude: lattitude, longitude: longitude)
    let arearadius: CLLocationDistance = 10000000
    // this 7000 gets a far range
    func centerMap(location: CLLocation) {
        let coordArea = MKCoordinateRegionMakeWithDistance(location.coordinate, arearadius, arearadius)
        cityMapView.setRegion(coordArea, animated: true)
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

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if (motion == .motionShake) {
            let city = newCity(quad: direction!)
            let systemSoundID = UInt32(truncatingIfNeeded: Int(city["sound"]!)!)
            AudioServicesPlaySystemSound(systemSoundID)
            displayData(city: city)
//            updateMap(city: city)
        }
    }
    
    func newCity (quad: String) -> [String : String] {
        print("/////////quad in func: \(quad)")
        if quad == "North" {
            var indx = Int(arc4random_uniform(UInt32(north.count)))
            while north[indx]["name"] == currentCity {
                indx = Int(arc4random_uniform(UInt32(north.count)))
            }
                return north[indx]
            
        } else if quad == "South" {
            var indx = Int(arc4random_uniform(UInt32(south.count)))
            while south[indx]["name"] == currentCity {
                indx = Int(arc4random_uniform(UInt32(south.count)))
            }
            return south[indx]
        }  else if quad == "East" {
            var indx = Int(arc4random_uniform(UInt32(east.count)))
            while east[indx]["name"] == currentCity {
                indx = Int(arc4random_uniform(UInt32(east.count)))
            }
             return east[indx]
        } else if quad == "West" {
            var indx = Int(arc4random_uniform(UInt32(west.count)))
            while west[indx]["name"] == currentCity {
                indx = Int(arc4random_uniform(UInt32(west.count)))
            }
            return west[indx]
        }
        
        return ["":""];
    }
    
    
    

}

