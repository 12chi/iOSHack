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

class HomeViewController: UIViewController {

    @IBOutlet weak var HomeMapView: MKMapView!
    @IBOutlet weak var SpinmeLabel: UILabel!
    
    @IBAction func stopButton(_ sender: UIButton) {
       
        // code to get direction
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destination = segue.destination as! DetailViewController
        
        // calculation direction from core location
        // set to variable before segue
        destination.direction = "direction"
    }

    @IBAction func unwindHome(sender: UIStoryboardSegue) {
        
    }
}
