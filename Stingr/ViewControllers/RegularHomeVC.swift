//
//  RegularHomeVC.swift
//  Stingr
//
//  Created by Stephon Fonrose on 2/22/20.
//  Copyright © 2020 Hivemind. All rights reserved.
//

import UIKit

class RegularHomeVC: UIViewController {

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
    
    
    
        
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


