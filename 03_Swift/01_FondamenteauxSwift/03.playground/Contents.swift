//selon le nombre d'operands, on distingue des operateurs
//-unaires
//-binaire
//-ternaire

//operateur d'attribution (binaire)
let nb = 5
var v:Int
v = nb

let (x,y) = (250, 300)
x
y

//attention en swift l'operateur d'attribution ne retourne rien
//on ne peut pas donc enchainer 2 attributions
//let v2 = v = 3

//ou encore un test et une attribution
//if 3 == (y = 3)

//ceci evite des erreurs de codage comme la suivante
// if v = 3

//operateur arithmetique (qui sont des operateur binaire)
//+,-,*,/,%

//en swift ces operateur n'autorise pas le depassement
//v = Int.max+1

//pour autoriser explicitement le depassement, il faut utiliser les operateurs de depassement
v = Int.max&+1

//v = UInt.max&+1 //erreur car les valeur negative n'existe pas pour UInt

//les operateur unaire + et -
var solde = -50
//var solde2 = +50 //non accepter car ambigous

//operateur d'assignation composer
//+=,-=,*=,/=,%=
v = 5
v += 2

//swift 3 ne connait plus ++ ou --
//v++

//operateur de comparaison
//==, !=, <, >, <=, >=
2==2
2 >= 3
v < v

//on peut comparer les tuples (seulement) si
//-ils ont le meme nombre de valeur
//-leurs valeurs sont comparable

//les tuples sont comparer de gauche à droite et la comparaison s'arrete une fois que le resultat est connu
("swift", 5) < ("Swift", 8) //les lettre maj sont avant les minuscule (plus petit)

//tuples avec expression
(3, "bonjour") == (5-2,"bon" + "jour")

//tuples avec bool
//("swift", true) < ("swift", false)  // bug car true et false peut pas etre evaluer avec < ou >

//operateur ternaire
var a = 5, b = 3

a>b ? "\(a) est plus grand que \(b)" : "\(a) n'est pas plus grand que \(b)"

//operateur nil-coalescing
//a ?? b
//l'operateur coalescing precedent
//1.deballe l'optionnel 'a', si cet optionel contient une valeur et retourne la valeur deballer, dans ce cas l'expression 'b' n'est pas evaluer
//2.retourne la valeur de l'expression 'b' sinon
var formation:String?
var formation2:String?
var stage = formation ?? formation2 ?? "swift"


//a ?? b est l'equivalent de la ternaire suivante
// a != nil a! : b


