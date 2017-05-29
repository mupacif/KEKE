//
//  TableViewController.swift
//  07_TableView
//
//  Created by etudiant on 5/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class GateauTableViewController: UITableViewController{
    
    @IBOutlet weak var maTable: UITableView!
    
    var tabGateau = [Gateau]()
    
    private func loadSampleGateau(){
        let img1 = #imageLiteral(resourceName: "gateauChocolat.jpg")
        let img2 = #imageLiteral(resourceName: "meringue.jpg")
        let img3 = #imageLiteral(resourceName: "tartePeches.jpg")
        let img4 = #imageLiteral(resourceName: "tiramisu.jpg")
        
        
        
        let gateau1 = Gateau(nom: "Gateau Chocolat",
                                   image: img1,
                                   description: "descritpion")
        let gateau2 = Gateau(nom: "Meringue",
                             image: img2,
                             description: "descritpion")
        let gateau3 = Gateau(nom: "Tarte au peches",
                             image: img3,
                             description: "descritpion")
        let gateau4 = Gateau(nom: "Tiramisu",
                             image: img4,
                             description: "descritpion")
        
        tabGateau += [gateau1, gateau2, gateau3, gateau4]
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        maTable.dataSource = self
        
        loadSampleGateau()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabGateau.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GateauTableViewCell", for: indexPath) as! GateauTableViewCell
        
        let gateau = tabGateau[indexPath.row]
        
        cell.etqDescription.text = gateau.description
        cell.etqImage.image = gateau.image
        cell.etqTitre.text = gateau.nom


        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
