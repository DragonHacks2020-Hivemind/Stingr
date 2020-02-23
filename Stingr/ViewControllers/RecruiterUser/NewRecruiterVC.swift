//
//  NewRecruiterVC.swift
//  Stingr
//
//  Created by Brandon Elmore on 2/23/20.
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

        
    }
    
    @IBAction func register(_ sender: Any) {
        
        let user = PFUser.current()!
        user["first"] = self.first.text
        user["last"] = self.last.text
        user["email"] = self.email.text
        user["school"] = self.school.text
        user["class"] = self.classification.text
        
        user.saveInBackground { (success, failure) in
            if let failure = failure {
                print("Error: \(failure.localizedDescription)")
            } else {
                self.performSegue(withIdentifier: "regToHome2", sender: nil)
            }
        }
    }
    
}
