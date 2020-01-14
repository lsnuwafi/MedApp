//
//  TipVC.swift
//  MedApp
//
//  Created by user157383 on 12/19/19.
//  Copyright © 2019 user157383. All rights reserved.
//

import Foundation
import UIKit
class TipVC: UITableViewController{
    var tip: Tip!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp(){
        //tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    
    
}

extension TipVC{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTipDetail"{
            let vc = segue.destination as! TipDetailVC
            vc.tip = tip
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tip = savedTip[indexPath.row]
        self.performSegue(withIdentifier: "toTipDetail", sender: self)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedTip.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = savedTip[indexPath.row].tiptitle
        return cell
        
    }
}
