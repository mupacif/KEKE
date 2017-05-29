//
//  ViewController.swift
//  02_Plist
//
//  Created by etudiant on 5/10/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var etqNom: UILabel!
    @IBOutlet weak var etqPrenom: UILabel!
    @IBOutlet weak var etqDateNaiss: UILabel!
    @IBOutlet weak var txtNbEnfants: UITextField!
    @IBOutlet weak var txtSalaire: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //init champ form
        
        //recup le bundle (collection ressource de l'app) installer par l'app sur le device
        let bundle = Bundle.main
        let path = bundle.path(forResource: "DonneePersonelles", ofType: "plist")!
        let dico = NSMutableDictionary.init(contentsOfFile: path)!
        
        print(dico)
        
        etqNom.text = "\(dico["Nom"]!)"
        etqPrenom.text = "\(dico["Prenom"]!)"
        etqDateNaiss.text = "\(dico["Date de naissance"]!)"
        txtNbEnfants.text = "\(dico["Nombre enfants"]!)"
        txtSalaire.text = "\(dico["Salaire"]!)"
        
        
    }

    @IBAction func btnSauvegarderPush(_ sender: Any) {
        sauvegarder()
    }
    
    
    func creerAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss",
                                                style: UIAlertActionStyle.default,
                                                handler: nil))
        self.present(alertController, animated: true,
                                    completion: nil)
    }
    
    
    func sauvegarder() {
        let fileManager = FileManager.default
        
        let documentDirectory =
            NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                .userDomainMask,
                                                true)[0] as String
        
        let path = documentDirectory + "/Perso.plist"
        
        print(path)
        
        if !fileManager.fileExists(atPath: path) {
            let dico = NSMutableDictionary()
            dico["Phone"] = txtPhone.text
            dico["Date de naissance"] = etqDateNaiss.text
            dico["Nom"] = etqNom.text
            dico["Prenom"] = etqPrenom.text
            dico["Salaire"] = txtSalaire.text
            dico["Nombre enfants"] = txtNbEnfants.text
            
            let isWritten = dico.write(toFile: path, atomically: true)
            print("Le fichier a été créer : \(isWritten)")
            if isWritten {
                creerAlert(title: "Sauvegarde", message: "Fichier bien créer")
            }
            
            
        } else {
            print("Suppression du fichier existant")
            deleteFile(file: "Perso.plist")
            creerAlert(title: "Sauvegarde", message: "Fichier existant supprimer")
        }
        
    }
    
    func deleteFile(file: String) {
        let fileManager = FileManager.default
        
        let documentDirectory =
            NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                .userDomainMask,
                                                true)[0] as String
        
        let path = documentDirectory + "/" + file
        
        do {
            try fileManager.removeItem(at: URL(fileURLWithPath: path))
        } catch let error as NSError {
            print("Erreur lors de la suppression: \(error)")
        }
    }
    
}

