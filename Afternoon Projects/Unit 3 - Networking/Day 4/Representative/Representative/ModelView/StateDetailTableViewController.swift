//
//  StateDetailTableViewController.swift
//  Representative
//
//  Created by AlphaDVLPR on 8/14/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {

    var representative: [Representative] = [] {
        
        didSet {
            
            tableView.reloadData()
            
        }
    }
    
    var state : String?
    
//-----------------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let state = state else { return }
        RepresentativeController.searchRepresentatives(forState: state) { (representative) in
            
            DispatchQueue.main.async {
                
                self.representative = representative
            }
        }
    }

    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representative.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "representativeCell", for: indexPath) as? RepresentativeTableViewCell else { return UITableViewCell() }

        // Configure the cell...

        let state = representative[indexPath.row]
        
        cell.nameLabel.text = state.name
        cell.districtLabel.text = state.district
        cell.linkLabel.text = state.link
        cell.officeLabel.text = state.office
        cell.partyLabel.text = state.party
        cell.phoneLabel.text = state.phone
        
        return cell
    }
    

   

}
