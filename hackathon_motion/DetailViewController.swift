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

class DetailViewController: UIViewController {
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
        ["name": "Rio de Janeiro", "country": "Federative Republic of Brazil ", "population": "7,456,682", "food_dishes":"", "climate": "", "languages": "Portuguese", "image": "rio", "longitude":"-22.908333", "latitude":"-43.196389", "sound":"1035"],
        ["name": "Mexico City", "country": "United Mexican States", "population": "8,918,653", "food_dishes":"Tortas de Tamales, Gorditas", "climate": "Subtropical highland climate ", "languages": "Spanish", "image": "mc", "longitude":"19.433333", "latitude":"-99.133333", "sound":"1036"],
        ["name": "Buenos Aires", "country": "Argentine Republic", "population": "13,591,863", "food_dishes":"Asados, Chimichurri", "climate": "Humid subtropical climate", "languages": "Spanish", "image": "ba", "longitude":"-34.603333", "latitude":"-58.381667", "sound":"1026"],
        ["name": "Santiago", "country": "Chile", "population": "7,314,176", "food_dishes":"Pastel de Choclo, Cazuela", "climate": "Semi-arid climate", "languages": "Spanish", "image": "santiago", "longitude":"-33.45", "latitude":"-70.666667", "sound":"1027"],
        ["name": "Panama City", "country": "Panama", "population": "880,691", "food_dishes":"Plantains,Hojaldras", "climate": "Tropical savanna climate", "languages": "Spanish", "image": "pc", "longitude":"8.983333", "latitude":"-79.516667", "sound":"1025"]
    ]
    
    
    // map location of new city
    @IBOutlet weak var cityMapView: MKMapView!
    
    // direction set by prepare segue
    var direction: String?
    
    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    
    @IBOutlet weak var climateLabel: UILabel!
    @IBOutlet weak var food_dishesLabel: UILabel!
    
    @IBOutlet weak var shakeDirLabel: UILabel!
    
    @IBOutlet weak var popupBack: UIView!
   
    @IBAction func resetButton(_ sender: Any) {
        if motionManager.isMagnetometerAvailable {
            print("We can detect device direction")
            startReadingMotionData()
        }
        else {
            print("We cannot detect device direction")
        }
        locationView.isHidden = true

    }
    
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
            countryLabel.text = "United States"
        }
        if let foodUW = city["food_dishes"] {
            food_dishesLabel.text = "popular dishes: \(foodUW)"
        }
        else {
            food_dishesLabel.text = "popular dishes: tacos"
        }
        
        if let climateUW = city["climate"] {
            climateLabel.text = "climate: \(climateUW)"
        }
        else {
           climateLabel.text = "climate: Always sunny"
        }
        if let imgUW = city["image"] {
            photoView.image = UIImage(named: "\(imgUW)")
        }
        else {
            photoView.image = UIImage(named: "paris")
        }
        
        shakeDirLabel.text = "Shake phone or press button to view another city \(direction) of here"
    }
    
    var motionManager = CMMotionManager()
    let opQueue = OperationQueue()
    var magnetometerData: CMMagnetometerData?
    var x: Double = 0
    var y: Double = 0
    var z: Double = 0
    var nums: [Double] = []
    var heading: Double = 0
//    var direction: String = "North"
    var currentCity:String = "San Jose"
    //    motionManager.stopMagnetometerUpdates()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData(city: newCity(quad: direction!))
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
        }
    }
    
    func newCity (quad: String) -> [String : String] {
        if quad == "North" {
            var indx = Int(arc4random_uniform(5))
            while north[indx]["name"] == currentCity {
                indx = Int(arc4random_uniform(5)+1)
            }
                return north[indx]
            
        } else if quad == "South" {
            var indx = Int(arc4random_uniform(5))
            while south[indx]["name"] == currentCity {
                indx = Int(arc4random_uniform(5)+1)
            }
            return south[indx]
        }  else if quad == "East" {
            var indx = Int(arc4random_uniform(5))
            while east[indx]["name"] == currentCity {
                indx = Int(arc4random_uniform(5)+1)
            }
             return east[indx]
        } else if quad == "West" {
            var indx = Int(arc4random_uniform(5))
            while west[indx]["name"] == currentCity {
                indx = Int(arc4random_uniform(5)+1)
            }
            return west[indx]
        }
        
        return ["":""];
    }
    
    func startReadingMotionData() {
        motionManager.magnetometerUpdateInterval = 0.5
        motionManager.showsDeviceMovementDisplay = true
        
        motionManager.startMagnetometerUpdates(to: opQueue) {
            (data: CMMagnetometerData?, error: Error?) in
            
            if let magnetometerData = data {
                print(magnetometerData)
                self.x = magnetometerData.magneticField.x
                self.y = magnetometerData.magneticField.y
                self.z = magnetometerData.magneticField.z
                print(" x: \(self.x), y: \(self.y), z: \(self.z)")
                self.nums = [self.x, self.y, self.z]
                
                if self.y > 145 {
                    self.direction = "North"
                } else if self.y > 120 && self.x > 0 {
                    self.direction = "West"
                }
                else if self.y < 120 && self.x < 0 {
                    self.direction = "East"

                }
                else {
                    self.direction = "South"
                }
            
            }
                
            else {
                print("Device motion is nil.")
            }
            
        }
        //        motionManager.stopMagnetometerUpdates()
    }

    
    

}

