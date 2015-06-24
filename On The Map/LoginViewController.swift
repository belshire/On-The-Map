//
//  ViewController.swift
//  On The Map
//
//  Created by Blake Elshire on 6/13/15.
//  Copyright (c) 2015 Blake Elshire. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        self.errorLabel.hidden = true
        self.errorLabel.text? = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func loginButtonTouchUp(sender: AnyObject) {
        self.errorLabel.hidden = true
        self.errorLabel.text? = ""
        
        if !usernameTextField.text.isEmpty && !passwordTextField.text.isEmpty {
            UdacityClient.sharedInstance().loginWithUsernameAndPassword(usernameTextField.text, password: passwordTextField.text) { (success, error) in
                if success {
                    dispatch_async(dispatch_get_main_queue(), {
                        let controller = self.storyboard!.instantiateViewControllerWithIdentifier("MapTabController") as! UITabBarController
                        self.presentViewController(controller, animated: true, completion: nil)
                    })
                }
                else {
                    dispatch_async(dispatch_get_main_queue(), {
                        self.errorLabel.text? = error!.localizedDescription
                        self.errorLabel.hidden = false
                    })
                }
            }
        }
    }

}

