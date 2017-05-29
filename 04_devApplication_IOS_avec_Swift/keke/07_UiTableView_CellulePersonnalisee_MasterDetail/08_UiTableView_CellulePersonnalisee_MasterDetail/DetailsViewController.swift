//
//  DetailsViewController.swift
//  08_UiTableView_CellulePersonnalisee_MasterDetail
//
//  Created by etudiant on 5/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var gateau_a_afficher:Gateau? //= Gateau(nom: "", nomImage: "", description: "")
    @IBOutlet weak var imgGateau: UIImageView!
    @IBOutlet weak var etqTitre: UILabel!
    @IBOutlet weak var etqDescription: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        imgGateau.image = UIImage(named: gateau_a_afficher!.nomImage)
        etqTitre.text = gateau_a_afficher!.nom
        etqDescription.text = gateau_a_afficher!.description
    }

    @IBAction func btnRetourTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
