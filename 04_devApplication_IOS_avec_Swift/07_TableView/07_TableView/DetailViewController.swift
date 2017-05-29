//
//  DetailViewController.swift
//  07_TableView
//
//  Created by etudiant on 5/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var etqImage: UIImageView!
    
    @IBOutlet weak var etqTitre: UILabel!
    @IBOutlet weak var etqDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPush(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

   

}
