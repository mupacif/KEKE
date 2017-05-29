//
//  ViewController.swift
//  03_FirstResponder
//
//  Created by etudiant on 5/11/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnCacherClavierTxt1(_ sender: Any) {
        txt1.resignFirstResponder()
    }
    
    @IBAction func btnCacherClavierTxt2(_ sender: Any) {
        txt2.resignFirstResponder()
    }
    
    
    @IBAction func btnFocusTx2Touch(_ sender: Any) {
        txt2.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //solution 1
        //txt1.resignFirstResponder()
        //txt2.resignFirstResponder()
        
        //solution 2 = terminer edition pour tous
        view.endEditing(true)
    }
    
    //cacher clavier lors du click sur le return du clavier
    @IBAction func btnReturnCacherTxt1(_ sender: Any) {
        txt1.resignFirstResponder()
    }
    
    //cacher clavier lors du click sur le return du clavier
    @IBAction func btnReturnCacherTxt2(_ sender: Any) {
        txt1.resignFirstResponder()
    }

}

