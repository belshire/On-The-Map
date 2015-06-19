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

class MapViewController: UIViewController, UINavigationBarDelegate, UIBarPositioningDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        self.navigationBar.delegate = self
    }
    
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }
}
