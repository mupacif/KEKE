//
//  Gateau.swift
//  07_TableView
//
//  Created by etudiant on 5/11/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import Foundation
import UIKit

class Gateau {
    var image:UIImage
    var nom:String
    var description:String
    
    init(nom: String, image: UIImage, description: String) {
        self.nom = nom
        self.image = image
        self.description = description
    }
}
