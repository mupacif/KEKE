//
//  ViewController.swift
//  01_Deviner
//
//  Created by etudiant on 5/10/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtSaisie: UITextField!
    
    @IBOutlet weak var etqDisplay: UILabel!
    @IBOutlet weak var etqScore: UILabel!
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        etqScore.text = "\(score)"
        etqDisplay.text = ""
    }

    @IBAction func btnTesterTouch(_ sender: Any) {
        //lecture reponse
        let saisie = txtSaisie.text
        
        //Creation aleatoire
        let valeurAdeviner: Int = Int(arc4random_uniform(5))//limite sup non inclus
        print("Le chiffre a deviner: \(valeurAdeviner)")
        
        if saisie == "\(valeurAdeviner)" {
            etqDisplay.text = "Reponse correct"
            etqDisplay.textColor = UIColor.green
            score += 1
        } else {
            etqDisplay.text = "Reponse incorrect"
            etqDisplay.textColor = UIColor.red
            score = score > 0 ? score - 1 : 0
        }
        
        //vider la reponse
        txtSaisie.text = ""
        
        //afficher score
        etqScore.text = "\(score)"
    }
    
    
  }

