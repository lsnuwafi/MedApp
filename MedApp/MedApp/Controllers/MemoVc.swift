//
//  MemoVc.swift
//  Final
//
//  Created by user157383 on 11/30/19.
//  Copyright © 2019 user157383. All rights reserved.
//

import Foundation
import UIKit
class Memovc: UITableViewController{
    
    var notes = [UNNotification]()
    let pathaa = [Any]()
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        print(favoriteMed)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        //self.tableView.reloadData()
    }
    
    func setUp(){
        print(favoriteMed.count)
        let table: UITableView! = self.tableView
        let center = UNUserNotificationCenter.current()
        center.getDeliveredNotifications(completionHandler: {requets in
            self.notes = requets
        })
        table.rowHeight = 220
        table.tableFooterView = UIView()
        let nib = UINib.init(nibName: "AlarmCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "cell")
        //table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toMedAlarm"{
            let paths =  tableView.indexPathsForSelectedRows
            var vcarray = [OTCMedicine]()
            if paths == nil {return}
            var intarr = [Int]()
            let vc = segue.destination as! AlarmPickerVC
            for index in paths!{
                //print("favomed is \(favoriteMed)")
                
                vcarray.append(favoriteMed[index.row] as! OTCMedicine)
                intarr.append(index.row)
                //vc.alarmMed.append(favoriteMed[index.row] as! OTCMedicine)
                
            }
            vc.alarmMed = []
            vc.favoIndex = intarr
            vc.ss = "asdasdasdasd"
            print("the med is \(vc.alarmMed)" )
            
        }
    }
    
    
}

extension Memovc {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteMed.count
        //notes.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
                //context.delete(users[indexPath.row])
               // do {
                   // try! delegate.saveContext()
                    favoriteMed.remove(at: indexPath.row)
            self.tableView.reloadData()
                //} catch let error as NSError {
                //    print("Could not save. \(error), \(error.userInfo)")
                //}
            
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AlarmCell
        if type(of: favoriteMed[row]) == OTCMedicine.self {
            let otcMed = favoriteMed[row] as! OTCMedicine
            cell.textLabel?.text = otcMed.name
            //cell.backgroundColor = .brown
        }   else {
            let vita = favoriteMed[row] as! PMMedicine
            cell.textLabel?.text = vita.name
            //cell.backgroundColor = .green
        }
       // cell.textLabel?.text = notes[row].request.content.title
        
        return cell
    }
    
    
}
