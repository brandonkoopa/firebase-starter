//
//  ViewController.swift
//  Firebase Demo
//
//  Created by Brandon Cooper on 3/9/16.
//  Copyright © 2016 Landy Land. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions
    
    @IBAction func createAccount(sender: AnyObject) {
        registerUser(emailInput.text!, pass: passwordInput.text!)
    }
    
    // MARK: Functions
    
    /**
     Register the user in Firebase with the specified email and password.
     **/
    func registerUser(email:String, pass:String) {
        myRootRef.createUser(email, password: pass,
            withValueCompletionBlock: { error, result in
                if error != nil {
                    print("There was an error creating the account")
                } else {
                    let uid = result["uid"] as? String
                    print("Successfully created user account with uid: \(uid)")
                    
                    // login with the new acocunt
                    self.loginUser(self.emailInput.text!, pass: self.passwordInput.text!)
                }
        })
    }
    
    /**
     Log the user into Firebase with the specified email and password.
     **/
    func loginUser(email:String, pass:String) {
        myRootRef.authUser(email, password: pass,
            withCompletionBlock: { error, authData in
                if error != nil {
                    print("Login was unsuccessful")
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
                    self.presentViewController(vc, animated: true, completion: nil)
                }
        })
    }
    
}

