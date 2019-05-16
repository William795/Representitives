//
//  RepTableViewCell.swift
//  Representitives
//
//  Created by William Moody on 5/16/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class RepTableViewCell: UITableViewCell {
    
    var repResults: SearchResults? {
        didSet{
            updateView()
        }
    }
    
    @IBOutlet weak var repNameLabel: UILabel!
    @IBOutlet weak var repPartyLabel: UILabel!
    @IBOutlet weak var repURLLabal: UILabel!
    @IBOutlet weak var repSectionLabel: UILabel!
    @IBOutlet weak var repPhoneLabel: UILabel!
    
    
    func updateView(){
        
        guard let represults = repResults else {return}
        repNameLabel.text = represults.name
        repPartyLabel.text = represults.party
        repURLLabal.text = represults.link
        repSectionLabel.text = represults.district
        repPhoneLabel.text = represults.phone
    }
    
}
