//
//  StateListTableViewController.swift
//  Representative
//
//  Created by AlphaDVLPR on 8/14/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return States.all.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)

        // Configure the cell...

        let state = States.all[indexPath.row]
        
//        guard let allStates = States["States"] else { return }

        cell.textLabel?.text = state
        
        return cell
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showCell" {
            
            guard let index = tableView.indexPathForSelectedRow else { return }
                
                guard let destinationVC = segue.destination as?
                    
                    StateDetailTableViewController else {return}
                
                let state = States.all[index.row]
                
                destinationVC.state = state
                
                
        }
    }
}
    


