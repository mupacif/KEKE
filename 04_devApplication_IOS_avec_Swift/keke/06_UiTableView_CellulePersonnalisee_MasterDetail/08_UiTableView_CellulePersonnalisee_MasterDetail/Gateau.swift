//
//  Gateau.swift
//  08_UiTableView_CellulePersonnalisee_MasterDetail
//
//  Created by etudiant on 5/11/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import Foundation

class Gateau
{
    var nomImage: String
    var nom: String
    var description: String
    
    init(nom:String, nomImage:String, description:String)
    {
        self.nom = nom
        self.nomImage = nomImage
        self.description = description
    }
}
