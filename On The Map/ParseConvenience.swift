//
//  ParseConvenience.swift
//  On The Map
//
//  Created by Blake Elshire on 6/19/15.
//  Copyright (c) 2015 Blake Elshire. All rights reserved.
//

import Foundation

extension ParseClient {
    func getStudentLocations(completionHandler: (result: [ParseLocation]?, error: NSError?) -> Void) {
        var parameters = ["limit": 100]
        
        let task = taskForGETMethod(ParseClient.Methods.StudentLocations, parameters: parameters) { JSONResult, error in
            if let error = error {
                completionHandler(result: nil, error: error)
            } else {
                if let results = JSONResult.valueForKey(ParseClient.JSONResponseKeys.Results) as? [[String : AnyObject]] {
                    var locations = ParseLocation.locationsFromResults(results)
                    
                    completionHandler(result: locations, error: error)
                } else {
                    completionHandler(result: nil, error: NSError(domain: "getStudentLocations parsing", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse getStudentLocations"]))
                }
            }
        }
    }
}