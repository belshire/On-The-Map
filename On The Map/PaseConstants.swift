//
//  PaseConstants.swift
//  On The Map
//
//  Created by Blake Elshire on 6/19/15.
//  Copyright (c) 2015 Blake Elshire. All rights reserved.
//

import Foundation

extension ParseClient {
    
    // MARK: - Constants
    struct Constants {
        
        // MARK: API Key
        static let ApiKey : String = "QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY"
        static let ApplicationID : String = "QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr"
        
        // MARK: URLs
        static let BaseURLSecure : String = "https://api.parse.com/1/classes/"
        
    }
    
    // MARK: - Methods
    struct Methods {
        
        // MARK: Authentication
        static let StudentLocations = "StudentLocation"
        static let StudentLocationsUpdate = "StudentLocation/{id}"
        
    }
    
    // MARK: - URL Keys
    struct URLKeys {
        
        static let ObjectID = "id"
        
    }
    
    // MARK: - JSON Body Keys
    struct JSONBodyKeys {
        
        
    }
    
    // MARK: - JSON Response Keys
    struct JSONResponseKeys {
        
        static let StatusMessage = ""
        static let Results = "results"
        
    }
    
}
