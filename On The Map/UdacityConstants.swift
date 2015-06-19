//
//  UdacityConstants.swift
//  On The Map
//
//  Created by Blake Elshire on 6/15/15.
//  Copyright (c) 2015 Blake Elshire. All rights reserved.
//

extension UdacityClient {
    
    // MARK: - Constants
    struct Constants {
        
        // MARK: API Key
        static let ApiKey : String = "ENTER_YOUR_API_KEY_HERE"
        
        // MARK: URLs
        static let BaseURLSecure : String = "https://www.udacity.com/api/"
        
    }
    
    // MARK: - Methods
    struct Methods {
        
        // MARK: Authentication
        static let Session = "session"
        
        static let User = "users/{id}"
        
    }
    
    // MARK: - URL Keys
    struct URLKeys {
        
        static let UserID = "id"
        
    }
    
    // MARK: - JSON Body Keys
    struct JSONBodyKeys {
        
        static let Udacity = "udacity"
        static let Username = "username"
        static let Password = "password"
        
    }
    
    // MARK: - JSON Response Keys
    struct JSONResponseKeys {
        
        // MARK: General
        static let Account = "account"
        static let Session = "session"
        
        // MARK: Authorization
        static let Registered = "registered"
        static let SessionID = "id"
        
        // MARK: Account
        static let UserID = "key"
        
        static let StatusNumber = "status"
        static let StatusMessage = "error"
        
    }
    
}
