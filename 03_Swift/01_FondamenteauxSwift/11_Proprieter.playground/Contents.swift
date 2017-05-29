import Foundation
//proprieter - les proprieter associent des valeurs a une classe, struc ou enum
/*
 On distingue:
 - des proprieter 'stored' - proprieter de stockage
 - de proprieter calculer (computed properties)
 */

//stored properties - des proprieter dont les valeurs ne dependent pas d'autres proprieter

struct DonneeStatistiqueEmploye {
    var anciennete:Int
    var anneeEmbauche:Int
}

var dse = DonneeStatistiqueEmploye(anciennete: 0, anneeEmbauche: 2010)
var date = Date()
var calender = Calendar.current
var annee = calender.dateComponents([.year], from: date).year!

dse.anciennete = annee - dse.anneeEmbauche
print(dse.anciennete)

//un proprieter de stockage peut etre 'lazy'
//si une proprieter est 'lazy', son init sera retarder jusqu'au moment ou proprieter est acceder en lecture le 1ere fois
//supposoons qu'une classe Etudes a besoin du nom et du prenom du stagiaire

class Etudes{
    var tbEtudes:[String] = []
    
    //init qui a besoin du nom et du prenom du stagiaire
    init(_ nom: String, _ prenom: String) {
        print("Creation d'une instance Etudes pour \(nom) \(prenom)")
        
        //normalement, je dois chercher les etudes du stagiaire dont le nom/prenom ont ete donner dans une db, ici on va les donner dans le code
        tbEtudes.append("swift")
        tbEtudes.append("obj-c")
        tbEtudes.append("cordova")
    }
}

class Stagiaire {
    var nom:String = ""
    var prenom:String = ""
    
    //la proprieter suivante contient une instance de type Etudes qui ne peut etre creer qu'apres la creation du Stagiaire
    //il faut donc retarder sa creation avec lazy
    lazy var etudes: Etudes = Etudes(self.nom, self.prenom)
}

var stagiaire = Stagiaire()
stagiaire.nom = "durant"
stagiaire.prenom = "pierre"

//on constate que le message a afficher lors de la creation de la valeur de la proprieter etude n'a pas ete afficher
//cad l'instance de etudes n'as pas encore ete creer

print("\(stagiaire.nom) \(stagiaire.prenom) \(stagiaire.etudes)")

//on constate l'apparition du message de creation de l'instance Etudes car nous avons demander l'affichage de la proprieter 'etudes' qui contient

//proprieter calculer: proprieter dont la valeur depend d'une ou plusieurs proprieter de stockage
//ces proprieter ne contienne pas une valeur mais sont capable d'en retourner une en faisant appel a un calcul qui utilise les proprieter de stockage

//pour calculer la valeur a retourner, on doit fournir un getter

class Spectacle {
    var nom = ""
    var heureDebut = 0
    var duree = 0
    
    //proprieter calculer
    var heureFin:Int{
        get{
            return heureDebut + duree
        }
        set(nouvellHeureFin){
            //modifier la durer en tenant ompte de cette nouvelle heure de fin
            duree = nouvellHeureFin - heureDebut
        }
    }
}

var spectacle = Spectacle()
spectacle.heureDebut = 15
spectacle.duree = 2
spectacle.heureFin
spectacle.heureFin = 18

//donner une autre valeur a cette proprieter calculer
print("le spectacle commence a  \(spectacle.heureDebut)h et dure \(spectacle.duree)h")

//dans la classe Spectacle, j'ai utiliser le nom 'nouvelleHeureFin' pour l'argument du setter de la proprieter calculer 'heureFin'
//si on ne donne pas ce nom, le nom par defaut de l'argument sera 'newValue'
//une proprieter calculer peut etre en 'readonly'


class Spectacle2 {
    var nom = ""
    var heureDebut = 0
    var duree = 0
    
    //proprieter calculer par defaut le get
    var heureFin:Int{
        return heureDebut + duree
    }
}

//Observateurs de proprieter

//un observateur de proprieter surveiller une propriete et repond aux changement de sa valeur
//remarque les proprieter lazy et les proprieter calculer ne peuvent pas avoir d'observateurs

/*
 il existe 2 observateurs:
 - willSet - observateur declencher avant le changement de la valeur de la proprieter
 - didSet - observateur declencher apres le changement de la valeur de la proprieter
 */

class Vehicule {
    var vitesse = 0.0{
        willSet(nouvelleValeur){
            print("Nouvelle vitesse demander \(nouvelleValeur)")
        }
        didSet{
            if vitesse > 120 {
                print("Nouvelle vitesse demander trop haute (\(vitesse))")
                print("Changement annuler")
                vitesse = oldValue
            }
        }
    }
}

var vehicule = Vehicule()
vehicule.vitesse = 100
print("Vitesse courante du vehicule \(vehicule.vitesse)")
vehicule.vitesse = 130
print("Vitesse courante du vehicule \(vehicule.vitesse)")

//variable globales et locales
//une variable globales est une var definie a l'exterieur de toute fct,methode,closure,etc
//on en a utiliser mais uniquement stored et sans observateur

var v1 = 10{
    willSet{
        print("v1 a passer a la valeur \(newValue)")
    }
    didSet{
        print("v1 passer de \(oldValue) a la valeur \(v1)")
    }
}

v1 = 5

var v2 = 30

var v3:Int{return v1 + v2}
v3

var globalCalculer:Int{
    get{
        return v2 - v1
    }
    set{
        v1 = v2 - newValue
    }
}

print("globalCalculer \(globalCalculer)")

//proprieter de type (ou proprieter static)
//proprieter static = qui appartient a un type (et non pas a une instance)
/*
 remarques:
 - ces proprieter doivent toujours avoir une valeur par defaut
 - ces proprieter sont de type 'lazy'(donc on ne doit pas utiliser explicitement le mot clef 'lazy'
*/

//l'exemple suivant ne contient que des get mais ces proprieter static peuvent avoir aussi des set

struct MaStructure {
    static var proprieterDeStockage = "valeur proprieter"
    static var proprieterCalculer: Int{
        get{
           return 1
        }
    }
}

enum MonEnum {
    static var proprieterDeStockage = "valeur proprieter"
    static var proprieterCalculer: Int{
        get{
            return 1
        }
    }
}

class Automobile {
    static var vitessMaxAutoroute = 120
    //proprieter calculer
    static var vitessMaxRouteDepartemental:Int{
        return 90
    }
}
Automobile.vitessMaxAutoroute = 100

//proposer un equivalent a la methode .toString de java
//swift propose la proprieter calculer 'description'
//il faut utiliser CustomStringConvertible pour directement afficher
class Personne: CustomStringConvertible{
    var prenom = ""
    var nom = ""
    var description:String{
        return "Personne: \(nom) \(prenom)"
    }
}

var p = Personne()
p.nom = "Martin"
p.prenom = "phillip"
print(p)
		