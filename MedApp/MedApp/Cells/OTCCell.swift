//
//  MedCell.swift
//  Final
//
//  Created by user157383 on 12/13/19.
//  Copyright © 2019 user157383. All rights reserved.
//

import Foundation
import UIKit
class OTCCell: UITableViewCell {
    
    @IBOutlet weak var nameLable: UILabel!


    @IBOutlet weak var mgLabel: UILabel!
    
    @IBOutlet weak var tabletLable: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.alpha = 0.8
        } else {
            self.alpha = 1
            
        }
    }
    
}
