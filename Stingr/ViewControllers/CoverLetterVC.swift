//
//  CoverLetterVC.swift
//  Stingr
//
//  Created by Brandon Elmore on 2/22/20.
//  Copyright © 2020 Hivemind. All rights reserved.
//

import UIKit
import MobileCoreServices

class CoverLetterVC: UIViewController, UIDocumentPickerDelegate {

    @IBOutlet weak var CoverLetterImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func UploadCoverLetter(_ sender: Any) {
        let DocumentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypeCompositeContent as String], in: .import)
                DocumentPicker.delegate = self
        //        kUTTypeCompositeContent
                DocumentPicker.allowsMultipleSelection = false
                present(DocumentPicker, animated: true, completion: nil)
            }
            
            func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]){
                
                
                 let selectedFileURL = urls.first
                    
                
                CoverLetterImage.image = UIImage(contentsOfPDFURL: selectedFileURL)
    }
}
