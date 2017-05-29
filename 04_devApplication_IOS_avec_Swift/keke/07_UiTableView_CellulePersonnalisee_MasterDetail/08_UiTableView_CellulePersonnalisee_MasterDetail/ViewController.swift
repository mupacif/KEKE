//
//  ViewController.swift
//  08_UiTableView_CellulePersonnalisee_MasterDetail
//
//  Created by etudiant on 5/11/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

//dans cet exmple (qui est un cpy/paste du précédent)
//on a supprimé le segéué et on veut créér/peupler/
//afficher le panneau details quand une ligne de la table a été sélécltionnée

//je dois donc intercepter et traiter l'évenement de la 
//sélection d'un ligne de la tbale 

//les méthodes qui permettent ce traitement sont imposées
//par le protocole

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var maTable: UITableView!
    
    var tbGateaux:[Gateau] = [] // [Gateau]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //informer la table qui est sa source de données 
        //(qui implémente les méthode du protcole)
        //UITableViewDataSource, c est a dire les 
        //methodes qui sont utilisées pour remplir
        //la table
        maTable.dataSource = self
        
        //informer la table que les methodes proposées par le 
        //protocole UITableViewDelegate sont implémentées ici,
        maTable.delegate = self
        
        tbGateaux.append(Gateau(nom: "Meringue", nomImage: "meringue.jpg", description: "La meringue description"))
        
        tbGateaux.append(Gateau(nom: "tarte aux peches", nomImage: "gateauChocolat.jpg", description: "Le gateau chocolat description"))
        
        tbGateaux.append(Gateau(nom: "Meringue", nomImage: "tartePeches.jpg", description: "La tarte aux peches description"))
        
        tbGateaux.append(Gateau(nom: "Tiramisu", nomImage: "tiramisu.jpg", description: "La tirmaisu description"))
        
        print(tbGateaux);
    }
    
    //implémenter les 3 méthodes dont j'ai besoin et 
    //qui sont imposées par le protocole UtableViewDataSource
    // - la methode qui retourne le nb de sections de ma table
    //(dans mon cas on qu'une seule section)
    // - la méthode qui retourne le nombre de ligne de la section passé
    //en paramètre 
    //- la methode qui fournit et qui rempli la cellule
    //du patd donné en paramètre
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tbGateaux.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //je vais récupérer une cellule réutilisable
        let cellule:MaCellule = tableView.dequeueReusableCell(withIdentifier: "maCellulePersonnalisee", for: indexPath) as! MaCellule
        
        //récuper le gateau corresponant a la ligne passé dans le indexPath
        
        let gateau = tbGateaux[indexPath.row]
        
        //peupler la cellule
        cellule.etqTitre.text = gateau.nom
        cellule.etqDescriprion.text = gateau.description
        cellule.imgGateau.image = UIImage(named: gateau.nomImage)
        
        
        return cellule
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //récupérer l'index de la ligne séléctionnée dans la table
        let idxLigneSelectionnee = maTable.indexPathForSelectedRow!.row
        
        //récupérer le gateau correspondant a la ligne séléctionnée
        let gateauSelectionnee = tbGateaux[idxLigneSelectionnee]
        
        //récupéré l'ecran de destination a partir du ségué
        let destination = segue.destination as!  DetailsViewController
        
        destination.gateau_a_afficher = gateauSelectionnee
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //recuperer l'index de la ligne selectionner dans la table
        let idxLignesSelectionnee = maTable.indexPathForSelectedRow!.row
        
        //recuperer le gateau correspondant a la ligne selectionner
        let gateauSelectionne = tbGateaux[idxLignesSelectionnee]
        
        //creer une instance de l'ecran de destination
        let panneauDetails =
            storyboard!.instantiateViewController(withIdentifier: "IdControleurDetails") as! DetailsViewController
        //injecter le gateau choisi
        panneauDetails.gateau_a_afficher = gateauSelectionne
        
        //afficehr le 2e controller
        present(panneauDetails, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

