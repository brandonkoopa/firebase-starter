//
//  ViewController.swift
//  Firebase Demo
//
//  Created by Brandon Cooper on 3/9/16.
//  Copyright © 2016 Landy Land. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions
    
    /** 
     Action for when the user selected the Login button.
     **/
    @IBAction func login(sender: AnyObject) {
        loginUser(emailInput.text!, pass: passwordInput.text!)
    }
    
    // MARK: Functions
    
    /**
     Log the user into Firebase with the specified email and password.
     **/
    func loginUser(email:String, pass:String) {
        myRootRef.authUser(email, password: pass,
            withCompletionBlock: { error, authData in
                if error != nil {
                    print("Login was unsuccessful")
                    self.errorLabel.text = "There was an error logging in to this account."
                } else {
                    print("Login was successful")
                    
                    yourEmail = self.emailInput.text!
                    yourPassword = self.passwordInput.text!
                    
                    // save
                    NSUserDefaults.standardUserDefaults().setObject(yourEmail, forKey: "yourEmail")
                    NSUserDefaults.standardUserDefaults().setObject(yourPassword, forKey: "yourPassword")
                    
                    // show Activies view controller
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewControllerWithIdentifier("ActivitiesViewController")
                    self.presentViewController(vc, animated: false, completion: nil)
                }
        })
    }

}

