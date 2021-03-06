//
//  ResumeVC.swift
//  Stingr
//
//  Created by Brandon Elmore on 2/22/20.
//  Copyright © 2020 Hivemind. All rights reserved.
//

import UIKit
import MobileCoreServices
import PDFImage

class ResumeVC: UIViewController, UIDocumentPickerDelegate {

    @IBOutlet weak var ResumeImageVIew: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func UploadFile(_ sender: Any) {
        let DocumentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypeCompositeContent as String], in: .import)
        DocumentPicker.delegate = self
//        kUTTypeCompositeContent
        DocumentPicker.allowsMultipleSelection = false
        present(DocumentPicker, animated: true, completion: nil)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]){
        
        let selectedFileURL = urls.first
        
        ResumeImageVIew.image = UIImage(contentsOfPDFURL: selectedFileURL)
       
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

//extension ViewController: UIDocumentPickerDelegate {
//
//    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]){
//
//
//        guard let selectedFileURL = urls.first else {
//            return
//        }
//
//        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//
//        let sand = dir.appendingPathComponent(selectedFileURL.lastPathComponent)
//
//        //if FileManager.default.fileExists(atPath: sand.path){
//            //print("FIle already uploaded")
//    //}
//        //else{
//
//            do{
//                try FileManager.default.copyItem(at: selectedFileURL, to: sand)
//                print("Copied File")
//                }
//            catch{
//                print("Error \(error)")
//        }
//    }
//}
