//
//  ViewController.swift
//  08_
//
//  Created by etudiant on 5/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit
import MapKit
import Contacts
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var txtAdress: UITextField!
    @IBOutlet weak var txtVille: UITextField!
    @IBOutlet weak var txtCp: UITextField!
    @IBOutlet weak var txtPays: UITextField!
    
    var coordonneDestination:CLLocationCoordinate2D?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func afficherMap() {
        //la carte avec la localisation courante, le point d'arrive et le trajet sera afficher par l'api Maps
        //cette api a besoin de lui passer les information en utilisant un dico contenant des clef qu'elle connait
        //Créer dico avec ces clef specifique et avec les valeur saisies
        
        let dicoAdresseDestination = [CNPostalAddressStreetKey: txtAdress.text!,
                                      CNPostalAddressCityKey: txtVille.text!,
                                      CNPostalAddressPostalCodeKey: txtCp.text!,
                                      CNPostalAddressCountryKey: txtPays.text!]
        
        //reunir les coordoner trouver par le geocoder et les saisies dans un seul objet
        let placemarkDestination = MKPlacemark(coordinate: coordonneDestination!,
                                               addressDictionary: dicoAdresseDestination)
        //creer un objet de type MKMapItem
        let mkMapItem = MKMapItem(placemark: placemarkDestination)
        
        //preciser des eventuelles option de parcours
        //ces options doivent etre donner aussi dans un dico avec des clef sprecifique
        let options = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
        
        //afficher la map avec le parcour calculer en fct des coordonner du point final et des options choisies
        //ce parcours aura comme point de depart la position courant de l'utilisateur
        mkMapItem.openInMaps(launchOptions: options)
        
    }

    @IBAction func afficherTrajetTouch(_ sender: Any) {
        //creer a partir des donner saisie, une chaine de caractere creant l'adress ou on veut arriver
        let adress = "\(txtAdress.text!), \(txtCp.text!), \(txtVille.text!), \(txtPays.text!)"
        
        //pour interroger le service de geolocalisation distant, je dois utiliser un objet CLGeocoder
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(adress){ (tbPlacemarks, erreur) in
            if erreur != nil{
                print("Code erreur geocoder: \(erreur!.localizedDescription)")
            } else if tbPlacemarks != nil && tbPlacemarks!.count > 0 {
                //afficher le premier item du tableau placemarks
                let placemark = tbPlacemarks![0]
                let location = placemark.location
                self.coordonneDestination = location!.coordinate
                
                self.afficherMap()
                print("Les coordonées du premier point trouvé")
                print("Latitude: \(self.coordonneDestination!.latitude), longitude: \(self.coordonneDestination!.longitude)")
            }
        }
    }

}

