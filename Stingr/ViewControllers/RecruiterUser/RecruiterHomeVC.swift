//
//  RecruiterHomeVC.swift
//  Stingr
//
//  Created by Stephon Fonrose on 2/22/20.
//  Copyright © 2020 Hivemind. All rights reserved.
//

import UIKit
import Parse

class RecruiterHomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func newEvent(_ sender: Any) {
        self.performSegue(withIdentifier: "newEventSegue", sender: nil)
    }
    
    @IBAction func allEvents(_ sender: Any) {
        self.performSegue(withIdentifier: "allEventsSegue", sender: nil)
    }
    
    @IBAction func logout(_ sender: Any) {
        PFUser.logOutInBackground { (error) in
            if let error = error {
                print("Can't log out: \(error.localizedDescription)")
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
