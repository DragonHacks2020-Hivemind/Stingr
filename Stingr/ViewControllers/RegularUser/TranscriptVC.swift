//
//  TranscriptVC.swift
//  Stingr
//
//  Created by Brandon Elmore on 2/22/20.
//  Copyright © 2020 Hivemind. All rights reserved.
//

import UIKit
import MobileCoreServices

class TranscriptVC: UIViewController, UIDocumentPickerDelegate {

    @IBOutlet weak var TranscriptImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func UploadTranscript(_ sender: Any) {
        
        let DocumentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypeCompositeContent as String], in: .import)
                DocumentPicker.delegate = self
        //        kUTTypeCompositeContent
                DocumentPicker.allowsMultipleSelection = false
                present(DocumentPicker, animated: true, completion: nil)
            }
            
            func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]){
                
                
                 let selectedFileURL = urls.first
                
                
                TranscriptImage.image = UIImage(contentsOfPDFURL: selectedFileURL)
    }
               
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
