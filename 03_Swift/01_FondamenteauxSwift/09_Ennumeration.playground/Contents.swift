//Enumeration: groupe de valeur lier par une certaines fonctionnaliter

enum Civiliter {
    case monsieur
    case madame
    case mademoiselle
}

//autre synthax possible
enum MoyenPaiement {
    case carteBleu, cheque, espece
}

//les enum definissent des types
var civilite: Civiliter

//meme chose mais avec init
var mdp = MoyenPaiement.cheque

//si le type de la var est connu, on peut utiliser l'affectation raccourcie suivante
civilite = Civiliter.monsieur
//on peut utiliser l'affectation raccourcie suivante
civilite = .mademoiselle

//analyser la valeur de la var civilite avec un switch
switch civilite {
case .monsieur:
    print("bonjour monsieur")
case .madame:
    print("bonjour madame")
case .mademoiselle:
    print("bonjour mademoiselle")
}

//quand le switch n'est pas exhaustif, le cas 'default' doit etre present
switch mdp {
case .carteBleu:
    print("voyus payer par carte")
default:
    print("nous n'acceptons que la carte")
}

//enum avgec des valeur associer
enum Couleur{
    case rgb(Int,Int,Int)
    case couleurNommer(String)
}
//attribuer a la var 'couleur' une couleur nommer
var couleur = Couleur.couleurNommer("violet")

//si je lui attribue une couleur rgb
couleur = Couleur.rgb(255, 0, 255)

//analyser la valeur de la var couleur
switch couleur {
case .rgb(let rouge, let vert, let bleu):
    print("Couleur rgb ayant les composant \(rouge) \(vert) \(bleu)")
case .couleurNommer(let nomCouleur):
    print("Couleur nommer contenant \(nomCouleur)")
}

//valeur par defaut
enum Formation:String {
    case java = "Java", swift = "Swift", objC = "Objective-C", cdva = "Cordova"
}

var formation:Formation = Formation.java
print(formation)
print(formation.rawValue)
print(formation.hashValue)

var formation2:Formation = Formation.swift
print(formation2)
print(formation2.rawValue)
print(formation2.hashValue)

enum Transport:Int{
    case voiture = 3, metro, bus, tram, taxi, avion
}

var mdt: Transport = .bus
print(mdt)
print(mdt.rawValue)
print(mdt.hashValue)

// init une var avec item de l'enum en utilisant sa rawValue
//on deballe la valeur car risuqe de nil si la rawValue est erroner
mdt = Transport(rawValue: 5)!

//si valeur erroner retourne une erreur
//binding pour regler le probleme
if let moyen = Transport(rawValue: 88){
    mdt = moyen
    print("Moyen de transport \(moyen)")
} else {
    print("Moyen de transport inexistant")
}
