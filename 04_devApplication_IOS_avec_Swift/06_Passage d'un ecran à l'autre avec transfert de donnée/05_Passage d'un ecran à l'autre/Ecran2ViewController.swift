//
//  Ecran2ViewController.swift
//  05_Passage d'un ecran à l'autre
//
//  Created by etudiant on 5/11/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class Ecran2ViewController: UIViewController {
    
    var texRecu: String = ""
    var ecran1: ViewController?
    
    
    @IBOutlet weak var txtSaisie: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        txtSaisie.text = texRecu
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnRetour(_ sender: UIBarButtonItem) {
        
        ecran1!.donneeRecu = txtSaisie.text!
        
        dismiss(animated: true, completion: nil)
    }
    
}
