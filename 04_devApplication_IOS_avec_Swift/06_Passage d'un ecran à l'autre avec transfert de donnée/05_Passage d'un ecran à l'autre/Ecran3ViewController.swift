//
//  Ecran3ViewController.swift
//  06_Passage d'un ecran à l'autre avec transfert de donnée
//
//  Created by etudiant on 5/11/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class Ecran3ViewController: UIViewController {
    
    var texRecu: String = ""
    var donneeAtransferer = ""

    @IBOutlet weak var txtSaisie: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtSaisie.text = texRecu
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnRetourTouch(_ sender: Any) {
        donneeAtransferer = txtSaisie.text!
        print("je passe par le button")
    }

    func rendreDonneesSaisie() -> String {
        return txtSaisie.text!
    }

}
