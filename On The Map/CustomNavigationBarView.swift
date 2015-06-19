//
//  CustomNavigationBarView.swift
//  On The Map
//
//  Created by Blake Elshire on 6/19/15.
//  Copyright (c) 2015 Blake Elshire. All rights reserved.
//

import Foundation
import UIKit

class CustomNavigationBarView: NSObject, UINavigationBarDelegate, UIBarPositioningDelegate {
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }
}