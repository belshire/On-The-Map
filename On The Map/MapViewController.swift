//
//  MapViewController.swift
//  On The Map
//
//  Created by Blake Elshire on 6/19/15.
//  Copyright (c) 2015 Blake Elshire. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, UINavigationBarDelegate, UIBarPositioningDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        self.navigationBar.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        ParseClient.sharedInstance().getStudentLocations() { locations, error in
            var annotations = [MKPointAnnotation]()
            
            if let locations = locations {
                for location in locations {
                    let lat = CLLocationDegrees(location.latitude!)
                    let long = CLLocationDegrees(location.longitude!)
                    
                    let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                    
                    let first = location.firstName!
                    let last = location.lastName!
                    let mediaURL = location.mediaURL!
                    
                    // Here we create the annotation and set its coordiate, title, and subtitle properties
                    var annotation = MKPointAnnotation()
                    annotation.coordinate = coordinate
                    annotation.title = "\(first) \(last)"
                    annotation.subtitle = mediaURL
                    
                    // Finally we place the annotation in an array of annotations.
                    annotations.append(annotation)
                }
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                self.mapView.addAnnotations(annotations)
            }
        }
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.pinColor = .Red
            pinView!.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as! UIButton
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }
    
    func mapView(mapView: MKMapView!, annotationView: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == annotationView.rightCalloutAccessoryView {
            let app = UIApplication.sharedApplication()
            app.openURL(NSURL(string: annotationView.annotation.subtitle!)!)
        }
    }
    
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }
}
