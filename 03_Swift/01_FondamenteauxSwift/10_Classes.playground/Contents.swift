/*
 Caracteristique communes:
 - definissent des proprieter pour stocker des valeurs
 - definissent des methodes (des fct)
 - definissent des init
 - peuvent avoir des extensions
 - peuvent implementer des protocoles
 
 Caracteristiques proposer par les classes seulement
 - heritage
 - transtypage de classe
 - deintialisateur
 - compteur de reference
 
 Caracteristique presente seulement pour les structure
 - les structures ont un init par defaut
 
 Autre differences
 -
*/

struct MonPoint {
    var x:Int
    var y:Int
}

//toutes les structures ont un init par defaut
//il permet de passer les valeurs en utilisant le nom de chaque proprieter
var unPoint = MonPoint(x:5,y:3)

//on peut aussi definir des valeurs par defaut
struct MonPoint2 {
    var x = 0
    var y = 0
}

//dans ces cas on peut creer un point sans donner les valeurs de ses champ
var unPoint2 = MonPoint2()

//evidemment, on peut utiliser le constr contenant des valeurs
unPoint2 = MonPoint2(x:4,y:5)

//pour acceder aux proprieter, on utilise la synthax '.'
print("Un point a les coordonner x=\(unPoint2.x) et y=\(unPoint2.y)")

//acces en ecriture
unPoint2.x += 2
unPoint2.y = 10
print("Un point a les coordonner x=\(unPoint2.x) et y=\(unPoint2.y)")

//structure imbriquer
struct MonRectangle {
    var pointHautGauche:MonPoint
    var pointBasDroite:MonPoint
}

var unRectangle = MonRectangle(pointHautGauche: MonPoint(x:1,y:1),
                               pointBasDroite: MonPoint(x:5,y:5))

//acces au champs des structure imbriquer
print("Les coordonner du rectangle: " +
"x1 = \(unRectangle.pointHautGauche.x), " +
"y1 = \(unRectangle.pointHautGauche.y), " +
"x2 = \(unRectangle.pointBasDroite.x), " +
"y2 = \(unRectangle.pointBasDroite.y)")

//une struc de type valeur
var point1 = MonPoint(x:1,y:1)
var point2 = point1
point1.x = 2

//je me demande si cette derniere attribution a modifier aussi le point 2
point2.x
//je constate que point2 n'a pas eter modif donc les struc sont de type valeur

class Voiture {
    var marque = ""
    var model = ""
    var cylindre = 0.0
}
var voiture1 = Voiture()
voiture1.marque = "Aston Martin"
voiture1.model = "D10"
voiture1.cylindre = 6500.0

var voiture2 = voiture1
voiture1.marque = "Toyota"
voiture1.model = "A22"
voiture1.cylindre = 3500.0

print(voiture2.marque)

//voiture2 modif donc type reference
//l'operateur identiter === (et son contraire !==) teste si 2 variable contiennent la meme ref
if voiture1 === voiture2 {
    print("voiture1 et voiture2 contiennent le meme objet")
}
//cela plante, on peut pas faire une simple egaliter pour les objet
/*
if voiture1 == voiture2 {
    print("voiture1 et voiture2 contiennent le meme objet")
}
 */

//pour tester l'egalite du contenu de 2 instances d'une certaine classe, il faut que la classe soit conforme au protocole
class Automobile: Equatable{
    var marque = ""
    var model = ""
    var cylindre = 0.0
    
    //override de l'operateur '==' pour realiser une egaliter simple
    public static func == (lhs:Automobile, rhs: Automobile) -> Bool{
        return lhs.marque == rhs.marque &&
        lhs.cylindre == rhs.cylindre &&
        lhs.model == rhs.model
    }
}

var auto1 = Automobile()
auto1.marque = "Aston Martin"
auto1.model = "D10"
auto1.cylindre = 6500.0

var auto2 = Automobile()
auto2.marque = "Aston Martin"
auto2.model = "D10"
auto2.cylindre = 6500.0

if auto1 == auto2 {
    print("valeur de auto1 et auto2 egales")
}

if auto1 === auto2 {
    print("instance identique")
} else {
    print("instance non identique")
}

//choisir entre class et struc
/*
 on utilise une struc quand:
 - on a besoin d'encapsuler des valeur relativement simple
 - on veut que les valeur encapsuler soit copier et non pas referencer
 - pas besoin d'heritage
 - pas definir des init (et utiliser celui par defaut)
 */

