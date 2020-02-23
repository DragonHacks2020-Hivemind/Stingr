//
//  AllEventsVC.swift
//  Stingr
//
//  Created by Stephon Fonrose on 2/23/20.
//  Copyright © 2020 Hivemind. All rights reserved.
//

import UIKit
import Parse

class AllEventsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var events: [PFObject?] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func fetchEvents() {
        let query = PFQuery(className: "Message")
        query.addAscendingOrder("createdAt")
        query.limit = 10
        query.includeKeys(["title","location","date","type","notes"])
        
        query.findObjectsInBackground { (events, error) in
            if let events = events {
                self.events = events
                self.tableView.reloadData()
            } else {
                print("Can't load events: \(error!.localizedDescription)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
        
        //BRANDON - Complete the EventCell
        
        return cell
    }
    
}
