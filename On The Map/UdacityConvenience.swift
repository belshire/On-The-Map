//
//  UdacityConvenience.swift
//  On The Map
//
//  Created by Blake Elshire on 6/15/15.
//  Copyright (c) 2015 Blake Elshire. All rights reserved.
//

import Foundation

extension UdacityClient {
    
    func loginWithUsernameAndPassword(username: String, password: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [String : AnyObject]()

        let jsonBody : [String:AnyObject] = [
            UdacityClient.JSONBodyKeys.Udacity: [
                UdacityClient.JSONBodyKeys.Username: "\(username)",
                UdacityClient.JSONBodyKeys.Password: "\(password)"
            ]
        ]
        
        /* 2. Make the request */
        let task = taskForPOSTMethod(Methods.Session, parameters: parameters, jsonBody: jsonBody) { JSONResult, error in
            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionHandler(success: false, error: error)
            } else {
                if let session = JSONResult.valueForKey(UdacityClient.JSONResponseKeys.Session) as? [String: AnyObject] {
                    self.sessionID = session[UdacityClient.JSONResponseKeys.SessionID] as? String
                    
                    if let user = JSONResult.valueForKey(UdacityClient.JSONResponseKeys.Account) as? [String: AnyObject] {
                        self.userID = user[UdacityClient.JSONResponseKeys.UserID] as? String
                        
                        completionHandler(success: true, error: nil)
                    }
                } else {
                    completionHandler(success: false, error: NSError(domain: "startSession",
                                                                     code: 0,
                                                                     userInfo: [NSLocalizedDescriptionKey: JSONResult.valueForKey(UdacityClient.JSONResponseKeys.StatusMessage) as! String]))
                }
            }
        }
    }
    
    func getUserData(userID: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [String : AnyObject]()
        
        var mutableMethod : String = Methods.User
        mutableMethod = UdacityClient.subtituteKeyInMethod(mutableMethod, key: UdacityClient.URLKeys.UserID, value: String(UdacityClient.sharedInstance().userID!))!
        
        let task = taskForGETMethod(mutableMethod, parameters: parameters) { JSONResult, error in
            
        }
    }

}