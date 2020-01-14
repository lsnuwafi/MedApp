//
//  AlarmPickerVC.swift
//  Final
//
//  Created by user157383 on 12/10/19.
//  Copyright © 2019 user157383. All rights reserved.
//

import Foundation
import UIKit
class AlarmPickerVC: UIViewController{
    
    let weekdayArr = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" ]
    
    
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var MonBt: UIButton!
    
    @IBOutlet weak var TueBt: UIButton!
    
    @IBOutlet weak var WedBt: UIButton!
    
    @IBOutlet weak var ThuBt: UIButton!
    
    @IBOutlet weak var FriBt: UIButton!
    
    @IBOutlet weak var SatBt: UIButton!
    
    @IBOutlet weak var SunBt: UIButton!
    
    var weekDaysList = [UIButton]()
    //var notifications = [medNotice]()
    var alarmMed : [OTCMedicine]!
    var ss = ""
    var favoIndex: [Int]!
    @IBAction func sechdualAlarm(_ sender: Any) {
        let date = timePicker.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = components.hour!
        let minute = components.minute!
        for bt in weekDaysList {
            if bt.isSelected {
                let date = createDate(weekday: bt.tag, hour: hour, minute: minute, year: 2019)
                //print(bt.tag)
                scheduleNotification(date)
            }
        }
       
    }
    
    
    
    func scheduleNotification(_ date:Date) {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "ASDFGHJ"
        content.body = "The early bird catches the worm, but the second mouse gets the cheese."
        content.categoryIdentifier = "alarm"
        
        content.sound = UNNotificationSound.default
        var dateComponents = DateComponents()
        content.userInfo["hour"] = Calendar.current.component(.hour, from: date)
        content.userInfo["minute"] = Calendar.current.component(.minute, from: date)
        content.userInfo["weekDay"] = pickWeekday(Calendar.current.component(.weekday, from: date))
        content.userInfo["medicine"] = getMedFromSegue()
        dateComponents.hour = 10
        dateComponents.minute = 30
        let triggerDaily = Calendar.current.dateComponents([.weekday, .hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
        myAlarm.append(request)
        

    }
    
    
    
    func createDate(weekday: Int, hour: Int, minute: Int, year: Int)->Date{

        var components = DateComponents()
        components.hour = hour
        components.minute = minute
        components.weekday = weekday // sunday = 1 ... saturday = 7
        components.weekdayOrdinal = 10
        components.timeZone = .current
        let calendar = Calendar.current
        //print(calendar)
        return calendar.date(from: components)!
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
    }
    
    func setup(){
        weekDaysList.append(contentsOf: [MonBt, TueBt, WedBt, ThuBt, FriBt, SatBt, SunBt])
        print("the int array is                 aaaaaaa     \(favoIndex[0])")
        //print(alarmMed)
        //print(ss)
        let center = UNUserNotificationCenter.current()
       
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
            } else {
                print("D'oh")
            }
        }
    }
    
    func getMedFromSegue() -> String{
        var str = ""
        for i in favoIndex{
            let med = favoriteMed[i]
            //print(type(of: med))
            if((med as? OTCMedicine) != nil){
                let otcMed = med as! OTCMedicine
                print("ssssssssadad")
                str +=  otcMed.name + "  " + String(otcMed.mg) + "mg" + "\n"}
        }
        return str
    }
        
        
        
    
    
    func ifSelected(_ myButton: UIButton){
        if myButton.isSelected == true {
          myButton.isSelected = false
          
        }else {
          myButton.isSelected = true
          
        }
        
    }
    @IBAction func pickWeekday(sender: UIButton){
            ifSelected(sender)
    
        }
    func pickWeekday(_ i :Int) -> String{
    
        
        return weekdayArr[i - 1]
    }
    
    
    
}

enum selectedTag: Int {
    case Monday    = 2
    case Tuesday   = 3
    case Wednesday = 4
    case Thursday  = 5
    case Friday    = 6
    case Saturday  = 7
    case Sunday    = 1
}
