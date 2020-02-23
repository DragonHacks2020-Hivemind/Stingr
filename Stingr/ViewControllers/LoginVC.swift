//
//  LoginVC.swift
//  Stingr
//
//  Created by Stephon Fonrose on 2/22/20.
//  Copyright © 2020 Hivemind. All rights reserved.
//

import UIKit
import Parse

class LoginVC: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var accountToggle: UISwitch!
    
    let invalidEntry = UIAlertController(title: "Sorry!", message: "Username and password are both required!", preferredStyle: .alert)
    
    let usernameTaken = UIAlertController(title: "Sorry!", message: "Username already taken!", preferredStyle: .alert)
    
    let wrongPassword = UIAlertController(title: "Sorry!", message: "Username and password combination is invalid!", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkForUser()
        
        let OKAction = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            self.invalidEntry.dismiss(animated: true, completion: nil)
        }
        
        invalidEntry.addAction(OKAction)
        usernameTaken.addAction(OKAction)
        wrongPassword.addAction(OKAction)

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkForUser()
    }
    
    func registerUser(isRecruiter: Bool) {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        if isRecruiter {
            newUser["accountType"] = "recruiter"
        } else {
            newUser["accountType"] = "regular"
        }
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                if error._code == 202 {
                    self.present(self.usernameTaken, animated: true, completion: nil)
                }
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                if self.accountToggle.isOn {
                    self.performSegue(withIdentifier: "recruiter", sender: nil)
                } else {
                    self.performSegue(withIdentifier: "regular", sender: nil)
                }
            }
        }
    }
    
    func loginUser() {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""

        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
             if let error = error {
                 if error._code == 101 {
                     self.present(self.wrongPassword, animated: true, completion: nil)
                 }
               print("User log in failed: \(error.localizedDescription)")
             } else {
                print("User logged in successfully")
                let recruiter = user!["accountType"] as! String == "recruiter" ? true : false
                if recruiter {
                    self.performSegue(withIdentifier: "recruiter", sender: nil)
                } else {
                    self.performSegue(withIdentifier: "regular", sender: nil)
                }
                
             }
          }
    }
    
    func checkForUser() {
        if PFUser.current() != nil {
            let user = PFUser.current()!
            let recruiter = user["accountType"] as! String == "recruiter" ? true : false
            if recruiter {
                self.performSegue(withIdentifier: "recruiter", sender: nil)
            } else {
                self.performSegue(withIdentifier: "regular", sender: nil)
            }
        }
    }
    
    @IBAction func signupPressed(_ sender: Any) {
        if usernameField.text!.isEmpty || passwordField.text!.isEmpty {
            present(invalidEntry, animated: true, completion: nil)
        } else {
            registerUser(isRecruiter: self.accountToggle.isOn)
        }
        
    }
    @IBAction func loginPressed(_ sender: Any) {
        if usernameField.text!.isEmpty || passwordField.text!.isEmpty {
            present(invalidEntry, animated: true, completion: nil)
        } else {
            loginUser()
        }
    }
}
