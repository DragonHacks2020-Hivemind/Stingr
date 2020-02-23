//
//  NewRecruiterVC.swift
//  Stingr
//
//  Created by Stephon Fonrose on 2/23/20.
//  Copyright © 2020 Hivemind. All rights reserved.
//

import UIKit
import Parse

class NewRecruiterVC: UIViewController {

    @IBOutlet weak var first: UITextField!
    @IBOutlet weak var last: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var school: UITextField!
    @IBOutlet weak var classification: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        finishRegistration()
    }
    
    func finishRegistration() {
        if let currentUser = PFUser.current() {
            currentUser["firstName"] = first.text!
            currentUser["lastName"] = last.text!
            currentUser["email"] = email.text!
            currentUser["school"] = school.text!
            currentUser["class"] = classification.text!
            
            try? currentUser.save()
            self.performSegue(withIdentifier: "firstRecruiterToHome", sender: nil)
                
            
//            currentUser.saveInBackground { (success, failure) in
//                if let failure = failure {
//                    print("Couldn't finish registration: \(failure.localizedDescription)")
//                } else {
//                    self.performSegue(withIdentifier: "firstRecruiterToHome", sender: nil)
//                }
//            }
        }
    }
}
