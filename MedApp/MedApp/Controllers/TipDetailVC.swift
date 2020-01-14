//
//  TipDetailVC.swift
//  MedApp
//
//  Created by user157383 on 1/13/20.
//  Copyright © 2020 user157383. All rights reserved.
//

import Foundation
import UIKit
class TipDetailVC: UIViewController{
    var tip : Tip!
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var content: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        tittle.text          = tip.tiptitle
        tittle.numberOfLines = 0
        content.text         = tip.contents
        content.isEditable   = false
    }
}
