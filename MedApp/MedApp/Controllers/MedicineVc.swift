//
//  MedicineVc.swift
//  Final
//
//  Created by user157383 on 12/5/19.
//  Copyright © 2019 user157383. All rights reserved.
//

import Foundation
import UIKit
class MedicineVc: UIViewController, UISearchResultsUpdating {

    
    
    @IBAction func favoMed(_ sender: Any) {
        
       
        

        var paths = tableView1.indexPathsForSelectedRows
        if paths == nil {return}
        for index in paths!{
            let cell = tableView1.cellForRow(at: index)
            //print(cell!.textLabel!.text!)
            if index.row < OTCMedicineList.count {
                favoriteMed.append(OTCMedicineList[index.row])
            }  else {
                favoriteMed.append(PMList[index.row - OTCMedicineList.count])
            }
        }
       
        
    
    }
    
    
    enum Cells: String {
        case OTCCell = "OTCCell"
        case PMCell = "PMCell"
    }
    @IBOutlet weak var tableView1: UITableView!
    
    
    
    var fiteredOTCMedicien = [OTCMedicine]()
    var filteredPMMedicine = [PMMedicine]()
    let searchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        
    }
    
    func setUp(){
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = self
        tableView1.tableFooterView = UIView()
        //tableView2.tableFooterView = UIView()
        tableView1.dataSource = self
        tableView1.rowHeight = 190
        tableView1.separatorColor = .black
        tableView1.separatorInset = UIEdgeInsets.zero
        //tableView2.dataSource = self
        let medNib = UINib.init(nibName: Cells.OTCCell.rawValue, bundle: nil)
        let vitaNib = UINib.init(nibName: Cells.PMCell.rawValue, bundle: nil)
        tableView1.register(medNib, forCellReuseIdentifier: Cells.OTCCell.rawValue)
        tableView1.register(vitaNib, forCellReuseIdentifier: Cells.PMCell.rawValue)
        //tableView2.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        searchFilter(searchString: searchController.searchBar.text ?? "")
    }
    
    
    private func searchFilter(searchString : String){
        fiteredOTCMedicien = OTCMedicineList.filter{ OTCMedicine in
            return OTCMedicine.name.lowercased().contains(searchString.lowercased())
        }
        filteredPMMedicine = PMList.filter{ PMMedicine in
            return PMMedicine.name.lowercased().contains(searchString.lowercased())
        }
        tableView1.reloadData()
    }
}

extension MedicineVc: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var cell = tableView1.cellForRow(at: indexPath)
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let medCell = tableView.dequeueReusableCell(withIdentifier: Cells.OTCCell.rawValue, for: indexPath) as! OTCCell
        let vitaCell = tableView.dequeueReusableCell(withIdentifier: Cells.PMCell.rawValue, for: indexPath)
        let otcMed: OTCMedicine
        let vitamin: PMMedicine
       
            if searchController.isActive && searchController.searchBar.text != ""{
                print("index path is \(indexPath.row)")
                print(fiteredOTCMedicien)
                if indexPath.row < fiteredOTCMedicien.count{
                    
                    otcMed  =  fiteredOTCMedicien[indexPath.row]
                    medCell.nameLable.text = otcMed.name
                    medCell.mgLabel.text = "\(otcMed.mg)mg"
                    medCell.tabletLable.text = "\(otcMed.tablet)Tablets"
                    return medCell
                    
                }   else if indexPath.row >= fiteredOTCMedicien.count {
                    
                    vitamin = filteredPMMedicine[indexPath.row - fiteredOTCMedicien.count]
                    
                    vitaCell.textLabel?.text = vitamin.name
                    return vitaCell
                    
                }
                
            }  else {
                if indexPath.row < OTCMedicineList.count {
                    otcMed = OTCMedicineList[indexPath.row]
                    medCell.nameLable.text = otcMed.name
                    medCell.mgLabel.text = "\(otcMed.mg)mg"
                    medCell.tabletLable.text = "\(otcMed.tablet)Tablets"
                    
                     //medCell.textLabel?.text = otcMed.name
                    return medCell
                }  else if indexPath.row >= OTCMedicineList.count {
                    //print("vitamin \(VitaminList.count)")
                    vitamin = PMList[indexPath.row - OTCMedicineList.count]
                    
                    vitaCell.textLabel?.text = vitamin.name
                    
                }
            }
            
            return vitaCell
        
        
        
    }
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          
        
            if (searchController.isActive && searchController.searchBar.text != ""){
                return fiteredOTCMedicien.count + filteredPMMedicine.count
            }
            
        return OTCMedicineList.count + PMList.count
            
       
       
    }
        
        

            
        }
    
    

