//
//  ViewController.swift
//  04_MemeActionPlusieursBoutons
//
//  Created by etudiant on 5/11/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnTouch(_ sender: UIButton) {
        //identifier sender
        if sender == btn1 {
            print("Btn1 clicker")
        } else if sender == btn2{
            print("Btn2 clicker")
        } else if sender.title(for: UIControlState.normal) == "Button 3" {
            print("Le button 3 a eter clicker")
        } else if sender.tag == 4 {
            print("Le button 4 a eter clicker par tag")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

