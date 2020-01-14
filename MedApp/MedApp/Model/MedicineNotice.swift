//
//  MedicineNotice.swift
//  Final
//
//  Created by user157383 on 12/11/19.
//  Copyright © 2019 user157383. All rights reserved.
//

import Foundation
import UserNotifications
var myAlarm = [UNNotificationRequest]()
let center = UNUserNotificationCenter.current()
struct medNotice {
    var id : String
    var title : String
    var medicine : OTCMedicine
    var alarmTime : DateComponents
}
