//
//  ViewController.swift
//  05_Passage d'un ecran à l'autre
//
//  Created by etudiant on 5/11/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtSaisie: UITextField!
    
    var donneeRecu = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        txtSaisie.text = donneeRecu
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
        
        //injecter les donnees
        controleurDestination.texRecu = txtSaisie.text!
        controleurDestination.ecran1 = self
        
        //afficher ce controller
        present(controleurDestination, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //recup le destinataire
        let destination = segue.destination
        
        if destination is Ecran2ViewController {
            let dest = destination as! Ecran2ViewController
            dest.texRecu = txtSaisie.text!
            dest.ecran1 = self
        }else if destination is Ecran3ViewController{
            let dest = destination as! Ecran3ViewController
            dest.texRecu = txtSaisie.text!
        }
    }
    
    @IBAction func retourEcran1 (segue : UIStoryboardSegue) {
        print("Execution retourEcran1")
        
        //recupere la source du 'unwing' (je reviens sur le meme segue)
        let ecran3 = segue.source as! Ecran3ViewController
        
        //recupere les donnees saisie dans l'ecran 3
        
        //solution 1
        //utiliser une proprieter exporter qui peut fournir ces donnees
        //dans donneeRecu car viewWillAppear s'occupe de l'affichage
        donneeRecu = ecran3.donneeAtransferer
        
        //solution 2
        //utiliser une methode exporter par l'ecran 3, capable de fournir les donnees
        donneeRecu = ecran3.rendreDonneesSaisie()
    }

}

