//closures = bloc de code
//il existe 3 formes de clotures
//-les fct globales
//-les fct imbriquer
//-les clotures d'expression - des closures inline, sans nom, qui capture les valeurs du contexte (de l'environnement d'execution)

//forme generale d'une cloture d'expression
/*
 { (parametre)-> typeRetour in
    code
 }
 */

//example: créer une closure pour un tableau de chaine de caractere
var tbFormations = ["swift","obj-c","cordova","xml","php"]
//tbFormations.sorted(by: <#T##(String, String) -> Bool#>)
//proposer une fct globale de comparaison entre 2 chaine
//proposer une fct a passer a la methode sorted(by:)
//assure un tri descendant
func comparerChaine(_ chaine1:String, _ chaine2:String)->Bool{
    return chaine1 > chaine2
}
//utiliser cette fct
var tbDescendant = tbFormations.sorted(by: comparerChaine)
print(tbDescendant)

//seconde possibiliter avec une closure
var tbAsc = tbFormations.sorted(by: {
    (p1:String,p2:String)->Bool in
    return p1<p2
})
print(tbAsc)

//le return peut etre ignorer si une seule ligne
tbAsc = tbFormations.sorted{
    (p1:String,p2:String)->Bool in
    p1<p2
}
print(tbAsc)

//swift fournit automatiquement les raccourcis $0,$1,$2,$3
//pour les nom de parametres des clotures inline
//si on les utilise, on peut omettre la liste des arguments
//leurs type et leur nombre sera deduit du context
tbAsc = tbFormations.sorted(by:{$0<$1})
print(tbAsc)
//avec un seul param
tbAsc = tbFormations.sorted{$0<$1}
print(tbAsc)

//methode operateur = fct lamda
//le type string surcharge les operateurs >,<,etc avec des methodes qui ont 2 parametre de type String et un retour Bool
//ces methode correspondent exactement au type de fonction exiger par by
//on peut donc encore simplifier pour obtenir
tbAsc = tbFormations.sorted(by:<)
print(tbAsc)

//cloture de fin = trailing closure
//si une cloture a bcp de ligne de code
/*
fun toto(clot:{
 *
 *
 *
 *
 *
 *
},arg2:String,arg3:String)
*/
//il est aventageux de la mettre a la fin (dernier argument)
//exemple
/*
func fctAvecClosure(p1:Int,p2:Double,dernierParam:{}->void)
{
    corps de la fct
}
 */

//fctAvecClosure(p1:5,p2:12.54,dernierParam:{corps de la cloture})

//syntahx raccourcie -> la closure peut etre ecrite apres toute en restant un param
//fctAvecClosure(p1:5,p2:12.54){le corps de la cloture}
tbAsc = tbFormations.sorted(){$0<$1}
print(tbAsc)

//les trailing closure sont interessants quand leur code contient un nombre (plus) grand d'instruction
let tbEntiers = [12,3,657]
//a partir de ce tableau on veut un tableau du gen ["unDeux","trois"]

//definir dic
let dicChiffres = [0:"zero",
                   1:"un",
                   2:"deux",
                   3:"trois",
                   4:"quatre",
                   5:"cinq",
                   6:"six",
                   7:"sept",
                   8:"huit",
                   9:"neuf"]

var chiffreTraduit = tbEntiers.map{
    (itemCourant)->String in
    var nb = itemCourant
    var chaine = ""
    repeat{
        chaine = dicChiffres[nb%10]! + chaine
        nb /= 10
    }while nb > 0
    return chaine
}
print(chiffreTraduit)

//en abreger
chiffreTraduit = tbEntiers.map{
    var nb = $0, chaine = ""
    repeat{chaine = dicChiffres[nb%10]! + chaine; nb /= 10}while nb > 0
    return chaine
}
print(chiffreTraduit)
