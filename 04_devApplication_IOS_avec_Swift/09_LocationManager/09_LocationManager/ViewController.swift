//
//  ViewController.swift
//  09_LocationManager
//
//  Created by etudiant on 5/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

/*
 But:
 utiliser:
 - le service de localisation pour obtenir la position courrante de l'utilisateur
 - le geocodeur pour obtenir une adresse a partir de cette position
 */

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var etqLatitude: UILabel!
    @IBOutlet weak var etqLongitude: UILabel!
    @IBOutlet weak var etqAltitude: UILabel!
    @IBOutlet weak var etqPrecisionH: UILabel!
    @IBOutlet weak var etqPrecisionV: UILabel!
    @IBOutlet weak var etqAdresse: UILabel!
    @IBOutlet weak var etqDistance: UILabel!
    
    var locationManager: CLLocationManager?
    var positionPrecedente: CLLocation?
    var distanceTotalParcourue: CLLocationDistance = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        etqLatitude.text = ""
        etqLongitude.text = ""
        etqAltitude.text = ""
        etqPrecisionH.text = ""
        etqPrecisionV.text = ""
        etqAdresse.text = ""
        etqDistance.text = "0"
        
        //recuperer une instance du service de localisation qui tourne sur le dispositif
        locationManager = CLLocationManager()
        
        locationManager!.desiredAccuracy = kCLLocationAccuracyBest
        
        //lorsque le gestionnaire de position (locationManager) constate que la position de l'utilisateur a subi une modification, il appel certaines methode proposer par le protocole CLLocationManagerDelegate
        
        //si je veux etre informer du changement de la position, je dois:
        //- implementer la/les methodes qui m'interessent
        //- informer le gestionnaire ou se trouvent ces methodes
        
        locationManager!.delegate = self
        
        //demander l'autorisation de tracer l'utilisateur
        locationManager!.requestWhenInUseAuthorization()
        
        
        //demarer service de localisation
        
        locationManager!.stopUpdatingLocation()
    }
    
    
    //methode du protocole CLLocationManagerDelegate qui est appeler lorsque la position courante a chanegr
    //comme la position a subi, peut-etre, plusieurs changement, cette methode a un tableau de position de type CLLocation
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Nouvelle position constater")
        let nouvellePosition = locations[locations.count - 1]
        
        //init, si besoin la valeur de la positionPrecedente
        if positionPrecedente == nil{
            positionPrecedente = nouvellePosition
        }
        
        //afficher les coordonees de la position
        etqAltitude.text = "\(nouvellePosition.altitude)"
        etqLatitude.text = "\(nouvellePosition.coordinate.latitude)"
        etqLongitude.text = "\(nouvellePosition.coordinate.longitude)"
        etqPrecisionV.text = "\(nouvellePosition.verticalAccuracy)"
        etqPrecisionH.text = "\(nouvellePosition.horizontalAccuracy)"
        
        //ajouter a la distance actuelle le dernier segment
        distanceTotalParcourue += nouvellePosition.distance(from: positionPrecedente!)
        etqDistance.text = String(format: "%.0f", distanceTotalParcourue)
        positionPrecedente = nouvellePosition
            
        //recuperer et afficher l'adresse de chaque nouvelle position
        //on utilise pour cela le service distant geocoder
        //creer instance de ce service
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(nouvellePosition) { (tbPlacemarks, erreur) in
            if erreur != nil {
                print("Erreur geocoder: \(erreur!.localizedDescription)")
                self.etqAdresse.text = ""
                return
            }
            
            if tbPlacemarks != nil && tbPlacemarks!.count > 0 {
                //je me limite au premier placemark du tableau
                let placemark = tbPlacemarks![0]
                
                //obtenir adresse complete sous forme d'un dico
                if let dicoAdresse = placemark.addressDictionary{
                    self.etqAdresse.text = "\(dicoAdresse["Street"]!)" + "\n\(dicoAdresse["ZIP"]!) " + "\(dicoAdresse["City"]!)" + "\n\(dicoAdresse["Country"]!)"
                }
            } else {
                self.etqAdresse.text = ""
            }
        }

            
            
    }

    @IBAction func btnRAZDistance(_ sender: Any) {
        distanceTotalParcourue = 0
        etqDistance.text = "0"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
