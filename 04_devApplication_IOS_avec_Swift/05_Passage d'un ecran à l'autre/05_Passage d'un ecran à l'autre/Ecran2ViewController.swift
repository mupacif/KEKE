//
//  Ecran2ViewController.swift
//  05_Passage d'un ecran à l'autre
//
//  Created by etudiant on 5/11/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class Ecran2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnRetour(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
