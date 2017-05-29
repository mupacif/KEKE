import Foundation
//boucles

for i in 6...8 {
    print(i)
}

//si le compteur n'est pas necessaire on le remplace par _

//calculer 2^3 dans une boucle
let base = 2
let puissance = 3
var resultat = 1

for _ in 1...puissance {
    resultat *= base
}
resultat

//plusieurs solutions pour un parcour d'un tableau (voir exercice precedent)
//meme chose pour les dictionnaire

resultat = 1
var compteur = 1
while compteur <= puissance {
    resultat *= base
    compteur += 1
}
resultat

//meme chose avec repeat/while
resultat = 1
compteur = 1
repeat{
    resultat *= base
    compteur += 1
}while compteur <= puissance
resultat

//utiliser if pour calculer impot avec 
//-salaire (12000,18000,32000,65000)
//-seuil impot (15000,25000,40000)
//-taux impot (0,10%,30%,50%)
var salaire:Double
//salaire = 12000 //0
//salaire = 18000 //300
//salaire = 32000//3800
salaire = 65000 //29500


var seuil:Int
var taux:Double
var total:Double = 0

if salaire > 15000 {
    taux = 0.1
    total += ((salaire-15000)*taux)
}
if salaire > 25000 {
    taux = 0.3
    total += ((salaire-25000)*taux)
}
if salaire > 40000 {
    taux = 0.5
    total += ((salaire-40000)*taux)
}
total

//switch
var formation = "Swift"
var durer:Int

//un switch en swift doit etre exhaustif ou avoir default
switch formation.lowercased() {
case "cordova":
    durer = 6
case "swift","obj-c":
    durer = 6
default:
    durer = 0
}

print("Formation \(formation), dure: \(durer) jours")

salaire = 65000
var impot:Double?

switch salaire {
case 0..<15000:
    impot = 0
case 15000..<25000:
    impot = (salaire - 15000)*0.1
case 25000..<40000:
    impot = (25000 - 15000)*0.1 + (salaire - 25000)*0.3
default:
    if salaire < 0 {
        print("le salaire ne peut pas etre negatif")
        impot = nil
    } else {
        impot = (25000 - 15000)*0.1 + (40000 - 25000)*0.3 + (salaire - 40000)*0.5
    }
}

if impot == nil {
    print("l'impot n'a pas ete calculer")
} else {
    print("impot de \(impot!)")
}

//switch & tuples
let prixDurer = (2000.0, 5)

//le swtch s'arrete au premier case qui est true
switch prixDurer {
case (1500 ..< 2500, 3 ..< 6):
    print("prix 1500 a 2500 durer entre 3 et 6 jour")
case (2000,5):
    print("formation cordo")
default:
    print("rien pour vous")
}

//switch et binding valeur
switch prixDurer {
case (let lePrix, 4...6):
    print("fomration 4 a 6 jour pour \(lePrix)")
case let (lePrix, laDurer):
    print("fomration \(laDurer) jour pour \(lePrix)")
default:
    print("rien")
}
// variable local
//lePrix

//les cas de figure case d'un switch peuvent avoir une clause where (pour verifier des contrainte sup)
let uneFormation = ("Javat", 2000.0, 5)

switch uneFormation {
case let(nom, prix, durer) where nom == "PHP" && prix/Double(durer) < 600:
    print("Formation PHP de \(prix) qui dure \(durer) et le prix/jour moins de 600")
case let (nom,_,_) where nom=="Java":
    print("formation Java")
    //default avec capture
case let (nom,prix,durer):
    print("j'ai tout nom:\(nom) prix:\(prix) durer:\(durer)")
default:
    print("0")
}

//instruction 'continue'
var formations = ["Node.js","HTML","Java","Hibernate","Spring","JEE", "Cordova"]
print("formation contenant va")
//afficher toute les formation contenant la chaine 'va' (fondation necessaire)
for formation in formations{
    if !formation.lowercased().contains("va"){
        continue
    }
    print(formation)
}

//break pour sortir du traitement (boucle,switch)
formation = "obj-c"
durer = 0

switch formation.lowercased() {
case "Cordova":
    durer = 6
case "swift","obj-c":
    durer = 13
    if formation.lowercased() ==  "obj-c"{
        break
    }
    durer += 2
default:
    break
}
print("Formation: \(formation), durer:\(durer)")

for formation in formations{
    if formation.lowercased().contains("va"){
        print(formation)
        break
    }
}

//fallthrought, par defaut swift ne permet pas de passer d'un tas de figure a un autre
//il est possible grace a falltrought
formation = "cordova"
switch formation.lowercased() {
case "cordova":
    print("cordova")
    fallthrough
case "swift","obj-c":
    print("swift")
default:
    print("default")
}

//boucle nommer
//chercher les nombre entier
let nMin = 5, nMax = 50
var v = nMin

//etiquette pour break
Boucle_Externe:
while true {
    if v < nMin || v > nMax {
        break
    } else {
        for i in 2..<v {
            //v n'est pas premier
            if v % i == 0{
                v += 1
                if v>nMax {
                    break Boucle_Externe
                } else {
                    continue Boucle_Externe
                }
            }
        }
        print("\(v)")
        v += 1
    }
}
//instruction guard = sentinel qui teste une condition
//si condition vrai l'appli execute le code sinon else (qui doit transfere le controle vers la sortie du bloc ou guard apparait)
//se fait grace a (beak,return, continue, fatalError())

func afficherDetail(formation:[String:Any]){
    guard let nomFormation = formation["nom formation"] else {
        print("la clef 'nom formation' n'a pas ete trouver")
        return
    }
    print("\tNom: \(nomFormation)")
}

func afficherDetailSansGuard(formation:[String:Any]){
    if let nomFormation = formation["nom formation"]{
        print("\tNom: \(nomFormation)")
    }else {
        print("la clef 'nom formation' n'a pas ete trouver")
        return
    }
}

var maFormation:[String:Any] = ["nom formation" : "swift", "prix" : 2000, "durer" : 5]
afficherDetail(formation: maFormation)
afficherDetailSansGuard(formation: maFormation)
