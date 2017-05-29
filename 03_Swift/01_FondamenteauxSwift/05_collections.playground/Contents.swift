//swift propose 3 type de base de collection
//- les tableau
//- les set - collections sans doublons
//- les dictionnaires (contenant des binomes clef/valeur)

//array
//creer un tableau vide
var tbEntiers = [Int]() // ici le type de var tbEntier est dedeuit a partir de [Int]
//pour tester si un tableau est vide:
tbEntiers.isEmpty
//la taille du tableau
tbEntiers.count
//autre facon de creer un tableau vide
tbEntiers = []; //ceci ne peut etre utiliser que si le type des element du tableau est connu - dans ce cas [Int]
//on peut preciser explicitement le type
var tbIntegers: [Int] = []
//creer un tableau pre-rempli avec une valeur par defaut
var tnRempli = Array(repeating: 5, count: 4)
//creer un tableau par concatenation de 2 autres (contenant le meme type)
var tnRempli2 = tnRempli + Array(repeating: 6, count: 4)

var tbFormations = ["Obj-c","swift","cordova"]
var tbheterogene = ["Obj-c","swift",5] as [Any]
//ou encore
var tbheterogene2:[Any] = ["Obj-c","swift",5]
//ou encore
var tbheterogene3:Any = ["Obj-c","swift",5]

//ajouter un nouvel element a la fin du tableau
tbFormations.append("Javascript")

//ajouter tous les elements d'un autres tableau
tbFormations += ["Node.js","HTML","Java","Hibernate","Spring","JEE"]

//acces indexer en L/E aux elements
tbFormations[1] = "swift 3.1"
tbFormations

//afficher le contenu d'un tableau en utilisant un intervalles
tbFormations[1...3]

//modif le contenu d'un tableau en utilisant un intervalles
tbFormations[1...3] = ["c","angularjs"]
tbFormations

//supprimer les elements de 2 a 4
tbFormations[2...4] = []
tbFormations

//inserer un element a un index specifier
tbFormations.insert("cordo", at: 0)

//supprimer un element a un index donner
tbFormations.remove(at: 0)
tbFormations

//parourir un tableau
//avec une boucle for
for i in 0..<tbFormations.count{
    print("\(tbFormations[i])")
}

//avec boucle forin
for formation in tbFormations{
    print(formation)
}

//recuperer l'index et l'element correspondant en meme temps
for(index, formation)in tbFormations.enumerated(){
    print("\(index):\(formation)")
}

//set = ensemble de valeur sans doublons, du meme type (qui doit etre perciser)
//cet ensemble de valeur n'a a pas un ordre defini
//dans un set on ne peut mettre que des valeurs de types ayant hashable
//valeur de hashage: c'est une valeur utiliser lors de comparaison
//pour etre identique, 2 elements doivent avoir la meme valeur de hashage
//tous les type natif de swift sont hashable

//declarer un set
var setChiffres:Set<Character>
//creer un set vide
setChiffres = []

//ajouter un item
setChiffres.insert("1")
setChiffres
setChiffres.count
setChiffres.isEmpty

setChiffres.insert("1")
setChiffres
setChiffres.count

setChiffres = []
setChiffres
setChiffres.count
setChiffres.isEmpty

var setFormations:Set<String> = ["Node.js","HTML","Java","Hibernate","Spring","JEE"]
//puisque le type dans ce cas, peut eter deduit du context, on peut utiliser

var setFormations2:Set = ["Node.js","HTML","Java","Hibernate","Spring","JEE"]

setFormations.remove("Node.js")
setFormations

//supprimler un item en precisant ses "coordonées" (sa "position")
//cette position est preciser par un setIndex

//pour trouver un setIndex d'un element, on utilise la methode index(of:)
var idx = setFormations2.index(of: "HTML")
//suprimer l'element a cette index
setFormations2.remove(at: idx!)
setFormations2

//si on cherche l'index d'un element inexistant, on obtient un optional qui contient nil
idx = setFormations2.index(of: "Java")

//pour tester si un set contient un certain element
if setFormations.contains("Java"){
    print("setFormation continet Java")
} else {
    print("setFormation continet pas Java")
}

//parcourir un set
for item in setFormations{
    print(item)
}

//swift ne definit pas un ordre pour les elements d'un set mais, on peut utiliser la methodfe sorted() pour les trier
print("setFormations trier")
for item in setFormations.sorted(){
    print(item)
}
setFormations
//si je veux que sorted() utilise mon propre critere de trie (d'odonancement) on utilise sorted(by:)
//par exemple, je veux trier les element de setFormation dans l'ordre alphabetique inverse

for item in setFormations.sorted(by: { (chaine1:String, chaine2:String) -> Bool in
    return chaine1 > chaine2
}) {
    print(item)
}

var tbData = ["Node.js": 1,"HTML": 5,"Java": 6,"Hibernate" : 89,"Spring": 200,"JEE": 845]

for key in tbData.keys {
    print("\t\(key)")
}

var tbKey = [String](tbData.keys)
var tbValues = [Int](tbData.values)
