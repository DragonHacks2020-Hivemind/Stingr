//
//  NewEventVC.swift
//  Stingr
//
//  Created by Stephon Fonrose on 2/23/20.
//  Copyright © 2020 Hivemind. All rights reserved.
//

import UIKit
import Parse

class NewEventVC: UIViewController {

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var type: UIPickerView!
    @IBOutlet weak var notes: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save(_ sender: Any) {
        //BRANDON - ADD ALERT IF TITLE EMPTY!!!
        createEvent()
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func createEvent() {
        let titText = titleLabel.text!
        let locText = location.text ?? ""
        let datInfo = date.date
        let typInfo = type.selectedRow(inComponent: 0)
        let notText = notes.text!
        
        let event = PFObject(className: "Event")
        
        event["title"] = titText
        event["location"] = locText
        event["date"] = datInfo
        event["type"] = typInfo
        event["notes"] = notText
        
        event.saveInBackground { (saved, failed) in
            if saved {
                print("Event was successfully created!")
                self.dismiss(animated: true, completion: nil)
            } else {
                //BRANDON - ADD ALERT HERE!!!
                print("Could not create event!")
            }
        }
    }

}
