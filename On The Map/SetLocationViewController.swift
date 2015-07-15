//
//  SetLocationViewController.swift
//  On The Map
//
//  Created by Blake Elshire on 6/24/15.
//  Copyright (c) 2015 Blake Elshire. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class SetLocationViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var locationTextView: UITextView!
    @IBOutlet weak var linkTextView: UITextView!
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet weak var enterLocationView: UIView!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        locationView.hidden = true
        enterLocationView.hidden = false
        
        locationTextView.delegate = self
        linkTextView.delegate = self
    }
    
    @IBAction func cancelModalView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func findOnMap(sender: AnyObject) {
        CLGeocoder().geocodeAddressString(locationTextView.text!) { placemarks, error in
            if let places = placemarks {
                var topResult: CLPlacemark = places[0] as! CLPlacemark
                var placemark: MKPlacemark = MKPlacemark(placemark: topResult)
                
                let regionRadius: CLLocationDistance = 1000
                let coordinateRegion = MKCoordinateRegionMakeWithDistance(placemark.location.coordinate,
                    regionRadius * 2.0, regionRadius * 2.0)
                self.mapView.setRegion(coordinateRegion, animated: true)
                self.mapView.addAnnotation(placemark)
            }
        }
        
        locationView.hidden = false
        enterLocationView.hidden = true
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        textView.text = ""
    }
    
    @IBAction func setLocation(sender: AnyObject) {
        
    }
}