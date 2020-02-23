//
//  RegularHomeVC.swift
//  Stingr
//
//  Created by Stephon Fonrose on 2/22/20.
//  Copyright © 2020 Hivemind. All rights reserved.
//

import UIKit
import Parse

class RegularHomeVC: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var CoverLetterButton: UIButton!
    
    @IBOutlet weak var ResumeButton: UIButton!
    
    @IBOutlet weak var TranscriptButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    var Resume:Bool = false
    
    
    var CoverL:Bool = false
    
    
    var Transcript:Bool = false
    
    @IBAction func setResumeCheckBox(_ sender: Any) {
        if !Resume {
            ResumeButton.setImage(UIImage(named: "Checked-Box"), for: UIControl.State.normal)
            Resume = true
        }
        else {
            ResumeButton.setImage(UIImage(named: "UnChecked-Box"), for: UIControl.State.normal)
            Resume = false
        }
        
    }
    
    
    @IBAction func setCoverLetterBox(_ sender: Any) {
        
        if !CoverL {
            CoverLetterButton.setImage(UIImage(named: "Checked-Box"), for: UIControl.State.normal)
            CoverL = true
            
        }
        else {
            CoverLetterButton.setImage(UIImage(named: "UnChecked-Box"), for: UIControl.State.normal)
            CoverL = false
            
        }
    }
    
    
    @IBAction func setTranscriptBox(_ sender: Any) {
        
        if !Transcript {
            TranscriptButton.setImage(UIImage(named: "Checked-Box"), for: UIControl.State.normal)
            Transcript = true
            
        }
        else {
            TranscriptButton.setImage(UIImage(named: "UnChecked-Box"), for: UIControl.State.normal)
            Transcript = false
            
        }
    }
    
    
    @IBAction func SendInfo(_ sender: Any) {
        if(!Resume && !CoverL && !Transcript){
            let InvalidEntry = UIAlertController(title: "Invalid Selection", message: "Please select one or more items to share", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            InvalidEntry.addAction(OKAction)
            self.present(InvalidEntry, animated: true)
            
        }
        if (EmailTextField.text?.isEmpty)! {
            let InvalidEntry = UIAlertController(title: "Sorry", message: "Please enter a valid email adress", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            InvalidEntry.addAction(OKAction)
            self.present(InvalidEntry, animated: true)
        }
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
    
   
