//
//  GateauTableViewCell.swift
//  07_TableView
//
//  Created by etudiant on 5/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class GateauTableViewCell: UITableViewCell {

    @IBOutlet weak var etqImage: UIImageView!
    @IBOutlet weak var etqDescription: UILabel!
    @IBOutlet weak var etqTitre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
