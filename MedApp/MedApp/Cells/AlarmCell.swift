//
//  AlarmCell.swift
//  Final
//
//  Created by user157383 on 12/13/19.
//  Copyright © 2019 user157383. All rights reserved.
//

import Foundation
import UIKit
class AlarmCell: UITableViewCell{
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var weekDayLabel: UILabel!
    
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var medLabel: UILabel!
    
    @IBOutlet weak var medTx: UITextField!
    @IBOutlet weak var capLabel: UILabel!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("initiniggngngngg")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
