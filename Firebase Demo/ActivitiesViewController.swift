//
//  ViewController.swift
//  Firebase Demo
//
//  Created by Brandon Cooper on 3/9/16.
//  Copyright © 2016 Landy Land. All rights reserved.
//

import UIKit
import Firebase

class ActivitiesViewController: UIViewController {
    
    // MARK: Variables
    
    // reference to the Firebase location
    let myRootRef = Firebase(url:"https://sweltering-inferno-695.firebaseio.com/")
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: Functions
    
    
    // MARK: Actions
    
    @IBAction func logOut(sender: AnyObject) {
        myRootRef.unauth()
        
        // save
        NSUserDefaults.standardUserDefaults().setObject("", forKey: "yourEmail")
        NSUserDefaults.standardUserDefaults().setObject("", forKey: "yourPassword")
        
        // show Login view controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("LoginViewController")
        self.presentViewController(vc, animated: false, completion: nil)
    }
    
    
}

