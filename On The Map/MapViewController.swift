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
    var studentLocations: [ParseLocation]?
    
    override func viewDidLoad() {
        self.navigationBar.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        ParseClient.sharedInstance().getStudentLocations() { locations, error in
            if let locations = locations {
                self.studentLocations = locations
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                self.addAnnotations(self.studentLocations!)
            }
        }
    }

    @IBAction func addStudentLocation(sender: AnyObject) {
//        UdacityClient.sharedInstance().userID
        let filteredLocations = self.studentLocations!.filter({ $0.uniqueKey! == "4035228606" })
        
        if (filteredLocations.count > 0) {
            let alert = UIAlertController(title: "User Location", message: "You already have a location set, would you like to update?", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: self.updateLocation))
            alert.addAction(UIAlertAction(title: "Update", style: UIAlertActionStyle.Default, handler: self.updateLocation))

            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func updateLocation(action: UIAlertAction!) {
        switch action.style {
        case .Default:
            println("default")
            performSegueWithIdentifier("setLocationViewSegue", sender: nil)
        
        case .Cancel:
            println("cancel")
        
        default:
            println("default")
        }
    }
    
    func addAnnotations(locations: [ParseLocation]) {
        var annotations = [MKPointAnnotation]()
        
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

        self.mapView.addAnnotations(annotations)
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
