//
//  MainVC.swift
//  Final
//
//  Created by user157383 on 12/9/19.
//  Copyright © 2019 user157383. All rights reserved.
//

import Foundation
import UIKit
class MainVC: UIViewController {
    
    
    
    @IBOutlet weak var dateL: UILabel!
    
    @IBOutlet weak var pointL: UILabel!
    
    @IBOutlet weak var simage: UIImageView!
    
    @IBOutlet weak var aImage: UIImageView!
    
    @IBOutlet weak var bImage: UIImageView!
    
    @IBOutlet weak var cImage: UIImageView!
    
    @IBOutlet weak var fImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        
        getNotification()
        OTCMedicineList.append(OTCMedicine("A", 200, 200))
        OTCMedicineList.append(OTCMedicine("b", 200, 200))

        //var ot1 = OTCMedicine(coder: <#T##NSCoder#>)
        OTCMedicineList.append(OTCMedicine("c", 200, 200))
        PMList.append(contentsOf: [PMMedicine("VA"), PMMedicine("Vb"), PMMedicine("Vc")])
    }
    
    func setUp(){

        //let date = Date()
        //let calendar = Calendar.current
        //let components = calendar.dateComponents([.day], from: date)
        //let day = components.day!
        //dateL.text = String(day)
        //var request = MedRequest()
        var tipsRequest = TipRequest()
    }
    
    func getNotification(){
        let center = UNUserNotificationCenter.current()
        center.getPendingNotificationRequests(completionHandler: {requests in
            for note in requests{
                myAlarm.append(note)
            }
            
        })
        
        
    }
    
}
