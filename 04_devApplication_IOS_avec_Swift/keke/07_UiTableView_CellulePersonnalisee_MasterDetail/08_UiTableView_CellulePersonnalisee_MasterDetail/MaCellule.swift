//
//  MaCellule.swift
//  08_UiTableView_CellulePersonnalisee_MasterDetail
//
//  Created by etudiant on 5/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class MaCellule: UITableViewCell {

    @IBOutlet weak var imgGateau: UIImageView!
    @IBOutlet weak var etqTitre: UILabel!
    @IBOutlet weak var etqDescriprion: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
