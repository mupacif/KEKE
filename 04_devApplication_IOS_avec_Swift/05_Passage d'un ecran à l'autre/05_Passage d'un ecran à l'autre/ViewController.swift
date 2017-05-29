//
//  ViewController.swift
//  05_Passage d'un ecran à l'autre
//
//  Created by etudiant on 5/11/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnDestinationSansSegue(_ sender: UIButton) {
        //creer instance du controlleur de destination
        
        //idDestinationSansSegue est l'id defini dans le main.storyboard pour le controleur destinationSansSegue, dans le champ 'storyboard id' par l'assistant d'identification
        let controleurDestination =
            storyboard?.instantiateViewController(withIdentifier: "idDestinationSansSegue")
                as! DestinationSansSegueViewController
        
        //afficher ce controller
        present(controleurDestination, animated: true, completion: nil)
    }

}

