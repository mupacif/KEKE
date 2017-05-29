import Foundation

let formation = "programmation avec swift"
var chaineVide1 = ""
var chaineVide2:String

//pour savoir si une chaine est vide, on utilise
//solution 1: isEmpty
chaineVide1.isEmpty ? "la chaine est vide" : "la chaine n'est pas vide"

//solution2: tester la longueur
chaineVide1.characters.count == 0 ? "la chaine est vide" : "la chaine n'est pas vide"

//l'operateur + (et deriver) est overrider pour concatener des chaines
var forma = formation
forma += " et Obj-c"

formation
forma

//carateres
for c in formation.characters{
    print(c)
}

//construire une chaine à partir d'un tableau de caracteres
let tbCaracteres:[Character] = ["J","'","a","i","m","e"," ","🐨"]
let jaime = String(tbCaracteres)

//autre initialisateur
//on a deja utiliser String(describing:)

//String(format:)
//pourquoi?
let v = 5
var msg = "\(v) * 0.123456789 = \(5 * 0.123456789)"

//je veux limiter le nombre de decimales afficher a 3
//attention fondation est necessaire
msg = "\(v) * 0.123456789 = \(String(format: "%.3f", 5 * 0.123456789))"

//en swift, les chaines de caracteres ne sont pas indexer par un entier mais par des valeurs de types String.Index (qui est une structure)

//pour naviguer a l'interieur d'un string, 2 index sont important
//- startIndex
//- endIndex

var salut = "bonjour swift"
var idxStart = salut.startIndex
salut.endIndex
//quel est le type de cette variable
String(describing: type(of: idxStart));

//ou
idxStart is Int

//erreur: un string.index ne peut pas etre modifier en utilisant des additions ou des soustraction de valeur de type int
//idxStart+1

//+ n'est pas overrider non plus pour des operation entre 2 String.Index
//tentative echouer d'obtenir la longueur de la chaine
//salut.endIndex - salut.startIndex

//si on veut calculer la difference entre 2 String.Index, il faut utiliser la methode distance
var inIndexFin = salut.distance(from: salut.startIndex, to: salut.endIndex)
inIndexFin is Int
//remarque: la var inIndexFin contient la valeur int de la postion de endIndex par apport a startIndex
salut.characters.count

//si je veux absolument attribuer une valeur (inutile) a startIndex
var intStartIndex = salut.distance(from: salut.startIndex, to: salut.startIndex)

//pour obtenir un caractere se trouvant a un string.index connu, on utiliser
salut.characters[salut.startIndex]
//mais je veux utiliser directement la chaine sans passer par le tableau de caracteres
salut[salut.startIndex]

//recuperer aussi le dernier caractere
//salut[salut.endIndex]
//on constate que endIndex pointes sur une position qui est situer apres le dernier caractere
//rappel: on ne peut pas soustraire un entier a partir d'un String.Index pour proposer la solution
//salut[salut.endIndex-1]
//pour obtenir un index juste avant la position d'un autre index on utilise "before"
var idx = salut.index(before: salut.endIndex)
//idx est un nouvel index qui pointes sur la chaine juste avant endIndex
salut[idx]
//meme chose sans passer par une var intermediare
salut[salut.index(before: salut.endIndex)]

//recup le second caractere
salut[salut.index(after: salut.startIndex)]

//recup tous les index (intervalles des index) enre startIndex et endIndex
var intervalle = salut.startIndex ..< salut.endIndex
salut[intervalle]

//meme chose mais sans le premier et le dernier caractere
intervalle = salut.index(after: salut.startIndex) ..< salut.index(before: salut.endIndex)
salut[intervalle]



//parcourir la chaine avec une boucles et after
idx = salut.startIndex
/*
while idx != salut.endIndex {
    print("salut[\(idx)] = \(salut[idx])")
    idx = salut.index(after: idx)
}
*/
//utiliser distance() pour afficher l'index en tant qu'entier
while idx != salut.endIndex {
    print("salut[\(salut.distance(from: salut.startIndex, to: idx))] = \(salut[idx])")
    idx = salut.index(after: idx)
}

//meme chose avec before
idx = salut.endIndex
repeat{
    idx = salut.index(before: idx)
    print("salut[\(salut.distance(from: salut.startIndex, to: idx))] = \(salut[idx])")
}while idx != salut.startIndex

//on peut avancer ou reculer de plusieurs position d'un coup en utilisant un offset (un decallage)
idx = salut.index(salut.startIndex, offsetBy: 3)
salut[idx]

//l'offset peut etre negatif
var idx2 = salut.index(salut.endIndex, offsetBy: -3)
salut[idx2]

intervalle = idx ..< idx2
salut[intervalle]

//quand on travaille avec offsetBy, on peut depasser les limites (ce qui provoque une erreur)
//pour eviter cela, on utilise limitedBy
//si un depassement est constate, l'optional retourner par la methode index contient nil
var decalage = 100
if let ix = salut.index(salut.startIndex, offsetBy: decalage, limitedBy: salut.endIndex) {
    print(salut[ix])
} else {
    print("decalage trop grand")
}

//on a obtenu tous les index de la chaine en utilisant l'operateur mi-ouvert intervalle entre startIndex et endIndex

//on peut obtenir la meme chose avec
salut.characters.indices

//utiliser cette collection d'indice pour parcourir la chaine
for ix in salut.characters.indices{
    //pour ne pas passer a la ligne terminator:""
    print(salut[ix], terminator: "")
}
print("")

//les chaines de caracteres swift sont des chaines unicode
//cela a plusieurs consequences

//une concatenation peut modifier le contenu d'une chaine mais pas forcement sa longeur
var chaine = "il fait en ete"
chaine.characters.count

//ajouter le caractere 0301 (voir https://unicode-table.com/en/) qui est l'apostrophe
chaine += "\u{0301}" //é
chaine.characters.count

//insertions et suppressions
//inserer un caractere
chaine = "bon annee"

chaine.insert("n", at: chaine.index(chaine.startIndex, offsetBy: 3))
chaine.insert("e", at: chaine.index(chaine.startIndex, offsetBy: 4))
chaine.insert("\u{0301}", at: chaine.index(chaine.endIndex, offsetBy: -1))


//inserer une chaine de caractere
chaine.insert(contentsOf: " et heureuse".characters,
              at: chaine.index(chaine.startIndex, offsetBy: 5))

//supprimer un caractere
chaine.remove(at: chaine.index(chaine.endIndex, offsetBy: -1))
chaine

//pour suppr une sous chaine contenue entre 2 limites je dois:
//-definir l'interval
//utiliser la methode removesubrange(intervalle)
intervalle = chaine.index(chaine.startIndex, offsetBy: 6) ..<
    chaine.index(chaine.startIndex, offsetBy: 18)
chaine.removeSubrange(intervalle)

//comparaison des chaines
var chaine1 = "abc"
var chaine2 = "ab"+"c"

chaine1 == chaine2

chaine1 = "Abc"

chaine1 == chaine2

let tbFormations = [
    "Java",
    "Swift",
    "Obj-c",
    "Javascript",
    "Cordova"
]

//compter le nombre de formations qui commencer par "Ja"
var nb = 0
for formation in tbFormations {
    if formation.hasPrefix("Ja"){
        nb += 1
    }
}
print("\(nb) formations commence en \"Ja\"")


//compter le nombre de formations qui commencer par "Ja"
nb = 0
for formation in tbFormations {
    if formation.hasSuffix("va"){
        nb += 1
    }
}
print("\(nb) formations finissent en \"va\"")

//le type string ne prevoit pas de methode trim()
//on peut en propose nous une ou plusieurs et les attacher au type string
//on peut le faire a l'iade d'une extension

extension String {
    func trim1() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    func trim2() -> String {
        let cs = CharacterSet.init(charactersIn: " !")
        return self.trimmingCharacters(in: cs)
    }
}

chaine = "    souffrannnnnnce   !      "
chaine.trim1()
chaine.trim2()