//
//  ViewController.swift
//  Firebase Demo
//
//  Created by Brandon Cooper on 3/9/16.
//  Copyright © 2016 Landy Land. All rights reserved.
//

import UIKit
import Firebase

// TODO: set your Firebase reference
let myRootRef = Firebase(url:"https://your-firebase.firebaseio.com/")
var yourEmail = ""
var yourPassword = ""

class InitViewController: UIViewController {
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // try loading saved data
        
        // your email address
        if NSUserDefaults.standardUserDefaults().objectForKey("yourEmail") != nil {
            yourEmail = NSUserDefaults.standardUserDefaults().objectForKey("yourEmail") as! String
        }
        
        // your password
        if NSUserDefaults.standardUserDefaults().objectForKey("yourPassword") != nil {
            yourPassword = NSUserDefaults.standardUserDefaults().objectForKey("yourPassword") as! String
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        // We want to try logging in after view did appear, because we want to make sure storyboard is visible before we go changing views.
        
        // try to log in user
        loginUser(yourEmail, pass: yourPassword)
    }
    
    // MARK: Functions
    
    /**
     Log the user into Firebase with the specified email and password.
     **/
    func loginUser(email:String, pass:String) {
        myRootRef.authUser(yourEmail, password: pass,
            withCompletionBlock: { error, authData in
                if error != nil {
                    print("Login was unsuccessful")
                    // There was an error logging in to this account
                    
                    // show Login view controller
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewControllerWithIdentifier("LoginViewController")
                    self.presentViewController(vc, animated: false, completion: nil)
                } else {
                    print("Login was successful")
                    // We are now logged in
                    
                    // show Activies view controller
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewControllerWithIdentifier("ActivitiesViewController")
                    self.presentViewController(vc, animated: false, completion: nil)
                }
        })
    }
    
}

