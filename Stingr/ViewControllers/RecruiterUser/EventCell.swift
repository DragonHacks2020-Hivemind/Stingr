//
//  EventCell.swift
//  Stingr
//
//  Created by Stephon Fonrose on 2/23/20.
//  Copyright © 2020 Hivemind. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var TitleLabel: UILabel!
    
    
    @IBOutlet weak var DateLabel: UILabel!
    
    
    @IBOutlet weak var LocationLabel: UILabel!
    
    
    @IBOutlet weak var TypeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
