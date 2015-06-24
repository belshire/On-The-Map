//
//  ParseLocation.swift
//  On The Map
//
//  Created by Blake Elshire on 6/23/15.
//  Copyright (c) 2015 Blake Elshire. All rights reserved.
//

import Foundation

struct ParseLocation {
    var createdAt: NSDate?
    var firstName: String?
    var lastName: String?
    var latitude: Double?
    var longitude: Double?
    var mapString: String?
    var mediaURL: String?
    var objectId: String?
    var uniqueKey: String?
    var updatedAt: NSDate?
    
    init(dictionary: [String: AnyObject]) {
        firstName = dictionary["firstName"] as? String
        lastName = dictionary["lastName"] as? String
        
        latitude = dictionary["latitude"] as? Double
        longitude = dictionary["longitude"] as? Double

        mapString = dictionary["mapString"] as? String
        mediaURL = dictionary["mediaURL"] as? String
    }
    
    /* Helper: Given an array of dictionaries, convert them to an array of ParseLocation objects */
    static func locationsFromResults(results: [[String : AnyObject]]) -> [ParseLocation] {
        var locations = [ParseLocation]()
        
        for result in results {
            locations.append(ParseLocation(dictionary: result))
        }
        
        return locations
    }
}
