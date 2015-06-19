//
//  UdacityUser.swift
//  On The Map
//
//  Created by Blake Elshire on 6/18/15.
//  Copyright (c) 2015 Blake Elshire. All rights reserved.
//

struct UdacityUser {
    
    var lastName = ""
    var firstName = ""
    
    init(dictionary: [String: AnyObject]) {
        lastName = dictionary["last_name"] as! String
        firstName = dictionary["first_name"] as! String
    }
    
}