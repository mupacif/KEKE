//: Playground - noun: a place where people can play

import Cocoa

//Optionals

//swift ne permet pas l'utilisation d'une variable non init
//parfois cette init ne peut pas etre faite, a un moment donner
//dans ce cas on utilise une optional

//une optionnal est une enveloppe qui peut contenir:
//-une valeur ou reference d'un objet
//-ou rien du tout (nil)

//tres souvent, les fct/methode/initialisateur retourne un optional
//exemple
var nombre = Int("123")
nombre = Int("bonjour")

//var nombre = nil  n'est pas accepter si la var n'est pas optional

//declarer et attribuer des valeur a un optional
var nbEnfants: Int? = 3
nbEnfants = 3

//par defaut, la valeur d'un optional non init est nil
var societe: String?

//pour deballer un optionnal, on peut utiliser l'operateur '!' apres le nom (nom!)
//nb = nbEnfant  Echec car nbEnfant car nil
//avant de deballer un optional il faut tester la presence du contenu

//pour tester si un optional contien une valeur, on peut utiliser 2 methode baser sur un test if:

//je veux recup le nb d'enfant si l'optional contient cette info ou afficher un message sinon
var nb:Int

if nbEnfants != nil {
    nb = nbEnfants! //ceci est un deballage explicite et return la valeur de l'optional
} else {
    print("nbEnfant ne contient rien")
}

//2eme façon de tester l'existance et recup la valeur
if let nTmp = nbEnfants{
    print("deballage reussi")
} else {
    print("nbEnfant ne contient rien")
}

//tentative d'utiliser nTmp à l'exterieur du test if
//print(nTmp)  Ne fct pas car il n'existe que dans le scope du if

//on peut inclure plusieurs optionnal bindings et des expression qui retourne des bool mais il faut les separer par ','
if let n1 = Int("1"), let n2 = Int("3"), n1 < n2, n1+n2 < 5{
    print("\(n1) + \(n2) < 5")
} else {
    print("le binding a echouer")
}
//remarque: les test et l'execution des expression du binding precedent s'arrete quand un premier echec a eu lieu
//le code precedent equivaut a (et il faut gerer les else
if let n1 = Int("1"){
    if let n2 = Int("2"){
        if n1 < n2 {
            if n1+n2 < 5{
                print("\(n1) + \(n2) < 5")
            }
        }
    }
}



