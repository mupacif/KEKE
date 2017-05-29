//: Playground - noun: a place where people can play

import Cocoa

//constante: valeur non modifiable stockée dans la mémoire
//elle porte un nom (elle a un identifiant)
let nbEnfants = 2
let nomCours = "Programmation swift"

//le simple fait d'utiliser (ecrire) l'identifiant détermine le playground de l'afficher
nbEnfants
nomCours

nbEnfants + 3
"Jaime le cours " + nomCours

//l'operateur + n'est overrider que pour concatener les chaines de caracteres (et non pas autres types)
//"Nombre enfants: " + nbEnfants

//on ne peut pas modifier la valeur d'un identifiant declarer let (constante)
//nbEnfants += 3

//on peut definir plusieurs constantes sur une meme lignes en utilisant une seule instruction (accent accepter)
let vitesseMaxAutoroute = 130, voiturePreferer = "Aston", g = 9.18

//on utilise ';' pour séparer plusieurs instructions sur la meme ligne
print(voiturePreferer);print(vitesseMaxAutoroute);print(g);

//si on veut concatener des valeurs de types differents pour obtenir une chaine de caractere, on utilise l'interpolation des string
let msg = "Nombre enfants: \(nbEnfants+3)"
print(msg)

//variable
var duree = 5
var nomStagiaire = "Pierre"

duree = 10
nomStagiaire += " " + "Durant"

//parfois je veux preciser le type de la variable, il peut etre donner explicitement
//parfois c'est necessaire comme l'exemple suivant
var dureFormation:Int

//exemple avec plusieurs variable
var cylindre:Int, prix:Float, moto = "Yamaha", couleur: String

//affectation differee
cylindre = 660
prix = 3251.25; couleur = "carbone"

//parfois on doit preciser expllicitement le type car le compilateur n'affecte pas le type souhaité:
//var temperature = 5
//temperature = 16.5

var temperature:Float = 5
temperature = 16.5

//on peut declarer le type en utilisant aussie cette synthax
var temperature2 = 16 as Float

//meme chose pour les constantes
let zeroKelvin:Float = -273
let couleurPreferer:String = "Bleu"

//swift utilise des caracteres unicode
//cela permet d'utiliser pour les identifiant/valeurs/fct/etc tout type de caracteres (accent et emoji par exemple)

var 🐎🐠 = "J'aime les animaux"
🐎🐠 = 🐎🐠 + "et swift aussi"
print("Contenu de la variable \(🐎🐠)")

var merde = "💩"
print(merde)

//les commentaire par bloc peut etre imbriquer

/* ceci est un
 /*
    ceci est un bloc de commentaire imbriquer (si non fermer porte une erreur
 */
 commentaire par bloc
*/


//booleans
var jaimeSwift: Bool
jaimeSwift = true

//affectation sans declaration de type
var swiftEstDifficile = false

//preciser des float/double
var vFloat: Float = 0.123456789123456789
var vDouble: Double = 0.123456789123456789

//litteraux chaine (string literal)
let intBinaire = 0b1001
let intHexa = 0xFA2
let intOcta = 0o25

let v1 = 2.5e2 //e pour la base 10 (2.5 * 10^2)
let v2 = 0x3p1 //p pour la base 2 (3 * 2^1)

//les literaux chaines peuvent etre utiliser pour formater les valeurs numeriques et faciliter la lecture
let vAvecZeroAGauche = 000123.456
let unMillard = 1_000_000_000
let unMillardEt9Millionnieme = 1_000_000_000.000_000_9

//conversions entre les valeurs numeriques
let trois = 3
let pointUnQuatre = 0.14
//erreur car les valeurs numeriques sont de type differentes
//let pi = trois + pointUnQuatre

let pi = Double(trois) + pointUnQuatre

//remarque: la conversion passe par un initialisateur (par un constructeur), il ne s'agit donc pas d'un transtypage (cast)

//conversion entre reel
var f1:Float = 5.1
//var d1:Double = f1
//echec car la conversion implicite entre un float et un double n'est pas asssurer
var d1:Double = Double(f1)

//declaration de plusieurs variable (meme de type different)
//avec init
var (r,q,p,s) = (10,5.2,"swift",true)
//sans initialisation
var (a,b,c,d):(Int,Float,String,Bool)
//avec type et init
var (u,x,y,z):(Int,Float,String,Bool) = (15,2.5,"obj-c",false)

print(u);

//on peut utiliser le type ANy pour stocker n'importe quel type de valeur (meme apres init)
var v: Any
v = q
v = p
v = z


//pour connaitre le type effective d'une variable, on utilise l'operateur 'is' (instanceOf de java)
var maVariable : String = "test"
var typeTrouver: String


if v is Int {
    typeTrouver = "Int"
} else if v is Float {
    typeTrouver = "float"
} else if v is String {
    typeTrouver = "string"
} else if v is Double {
    typeTrouver = "double"
} else if v is Bool {
    typeTrouver = "bool"
} else {
    typeTrouver = "autres"
}

typeTrouver

//tuple: variable ou constante qui contient plusieurs valeurs individuelles (meme de type different)
var employe = ("Pierre", "Martin", 1998, 2000.0);
//ou, si on veut imposer des types
var employe2: (String, String, Int, Float) =
    ("", "Martin", 1994, 55.8);

//pour decomposer un tuple en valuer individuelles (const ou var) on utilise
let (prenom, nom, anneeNAiss, salaire) = employe
prenom
salaire
//la recup precedente a ete faite par position
//si je veux recup qu'une valeur par position, j'utilise
let(_,_,annee,_) = employe

//on peut aussi passer explicitement la position comme un index
var nomEmploye = employe.1

//on peut aussi utiliser des noms pour les champ d'un tuple
let societe = (nomSociete: "Apple", nbEmploye: 20000, ca: 2.7e9)

//recuperer la valeur d'un champ nommer
let chiffreAffaire = societe.ca
societe.nomSociete

//les types predefinis de swift (int, float, double, bool, uint8, int32,etc) sont implementer comme des structures
//ces structures contiennent des informations supplementaires concernant le type en question
UInt8.max
Int.max
Int64.max
Int32.max

//swift permet de definir des alias de type
//alias = nom alternatif (un surnom)
typealias VolumeRadio = UInt8 //ce type peut contenir des valeur entre 0 et 255
var volumeSon = VolumeRadio.max

typealias 🐨 = String
var compagnie: 🐨




