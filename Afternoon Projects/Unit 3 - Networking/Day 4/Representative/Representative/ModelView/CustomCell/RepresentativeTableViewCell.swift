//
//  RepresentativeTableViewCell.swift
//  Representative
//
//  Created by AlphaDVLPR on 8/14/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var officeLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    var representative : Representative? {
        
        didSet {
            
            updateViews()
        }
    }

func updateViews() {
    
    guard let representative = representative else { return }

    self.nameLabel.text = representative.name
    self.partyLabel.text = representative.party
    self.stateLabel.text = representative.state
    self.districtLabel.text = representative.district
    self.phoneLabel.text = representative.phone
    self.officeLabel.text = representative.office
    self.linkLabel.text = representative.link
    
}
}
