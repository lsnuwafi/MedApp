//
//  AlarmViewerVC.swift
//  Final
//
//  Created by user157383 on 12/13/19.
//  Copyright © 2019 user157383. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
class AlarmViewerVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp(){
        let nib = UINib.init(nibName: "AlarmCell", bundle: nil)
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 210
        tableView.separatorColor = .black
        tableView.separatorInset = .zero
        //print(myAlarm.count)
    }
    
    @IBAction func clearAll(_ sender: Any) {
        center.removeAllPendingNotificationRequests()
        myAlarm.removeAll()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("the number of notify are\(myAlarm.count)")
        tableView.reloadData()
    }
    
    
}

extension AlarmViewerVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myAlarm.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AlarmCell
        let alarmc = myAlarm[indexPath.row].content
        cell.textLabel?.text = myAlarm[indexPath.row].content.userInfo["medDic"] as? String
        //AlarmCell.timeLabel = alarm.trigger?.value(forKey: "date")
        let timeStr = String(alarmc.userInfo["hour"] as! Int) + ":" + String(alarmc.userInfo["minute"] as! Int)
        cell.timeLabel.text = timeStr
        cell.weekDayLabel.text = alarmc.userInfo["weekDay"] as! String
        cell.medTx.text = alarmc.userInfo["medicine"] as? String
        //print(alarmc.userInfo["medDic"]!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let center = UNUserNotificationCenter.current()
            center.removeDeliveredNotifications(withIdentifiers: [myAlarm[indexPath.row].identifier])
            myAlarm.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}
