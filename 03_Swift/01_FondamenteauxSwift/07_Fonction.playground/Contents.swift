//fonction

//func sans arguments no type de retour
func direBonjour(){
    print("bonjour")
}
direBonjour()

// un parametre et retourne rien
func dire(nom: String){
    print(nom)
}

func message(nom: String)->String{
    return nom
}

dire(nom: "yooop")

//retourne une valeur
func concat(mot1: String, mot2: String)->String{
    return mot1 + mot2
}
concat(mot1: "sou", mot2: "fraaaaaance")

//tuple pour retourner plusieurs valeurs et optionnel
func returnMaxMin(tb:[Int])->(vMin:Int,vMax:Int)?{
    if tb.count == 0 {
        return nil
    }
    var leMin = tb[0]
    var leMax = tb[0]
    
    
    for i in tb[1..<tb.count] {
        if i<leMin {
            leMin = i
        } else if i>leMax{
            leMax = i
        }
    }
    return(leMin,leMax)
}
let tupleMaxMin = returnMaxMin(tb: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])
print(tupleMaxMin!)


//fct parametres par defauts
//underscore = etiquette inexistante pour l'appel de fct
func creerAfficherMessageBonjourV5(_ destinataire:String, _ avecAffichage:Bool = false) -> String {
    if avecAffichage {
        direBonjour()
    }
    return message(nom: "lol")
}

//appel
creerAfficherMessageBonjourV5("lol")
creerAfficherMessageBonjourV5("loool", true)

//paramettre variadique
//un parametre  variadique accepte zero, un plusieurs valeurs d'un type donner
//bref on parle d'un nombre variable de valeur

func calculerMoyenne(_ valeur:Any...)->Double{
    var somme:Double = 0
    var nb = 0
    //analyser les valeurs passer par le biais du parametre variadique "valeur"
    for v in valeur {
        if v is Int {
            if let n = v as? Int {
                somme += Double(n)
                nb += 1
            }
        } else if v is Float{
            if let n = v as? Float {
                somme += Double(n)
                nb += 1
            }
        } else if v is Double{
            if let n = v as? Double {
                somme += n
                nb += 1
            }
        }  else if v is String{
            print("\(v)")
        } else {
            let leType = String(describing: type(of:v))
            print("Type de donner '\(leType)', ayant la valeur \(v) non pris en compte")
        }
    }
    return somme / Double(nb)
}
//appel
var resultat = calculerMoyenne("la valeur de la moyenne est :",4,3.0,11.0,true)
print(resultat)

//parametre in-out
//en swift les parametre sont par defaut des constantes
/*
func modifierParametre(pInt: Int){
    pInt = 1
}
 */
//si on veut neanmoins, modifier les param d'un func il faut les declarer inout
//limitation
//- un param variadique ne peut pas etre inout
//- un param inout ne peut pas avoir une valeur par defaut
//- lors de l'appel de la func, chaque param inout doit etre preceder par l'operateur address '&'

var v1 = 1
var v2 = 2

func interchanger(_ p1:inout Int, _ p2:inout Int){
    let tmp = p1
    p1 = p2
    p2 = tmp
}
print("Avant appel interchanger(): v1=\(v1), v2=\(v2)")
interchanger(&v1, &v2)
print("Apres appel interchanger(): v1=\(v1), v2=\(v2)")

//le type defini par une func

//chaque func swift a un type specifique defini par:
//-les types de params
//-le type de retour

//par example, la func suivante defini le type
func calculer(prixHT:Double, typeTVA:String) -> Double? {
    if prixHT < 0 {
        fatalError("Le prix ne peut pas etre negatif")
    }
    var somme = prixHT
    
    //"TVA2", "tva5", "tva20"
    switch typeTVA.lowercased() {
    case "tva2":
        somme += (prixHT*0.02)
    case "tva5":
        somme += (prixHT*0.05)
    case "tva20":
        somme += (prixHT*0.20)
    default:
        print("Mauvais code TVA")
        return nil
    }
    return somme
}

calculer(prixHT: 100, typeTVA: "tva2")
calculer(prixHT: 100, typeTVA: "tva5")
calculer(prixHT: 100, typeTVA: "tva20")
calculer(prixHT: 100, typeTVA: "tva1")
//calculer(prixHT: -1, typeTVA: "tva20")

//modifier le type defini par cette func et son code pour lui permettre de lever et propager une exception
//le type de la func devient:
func calculer2(prixHT:Double, typeTVA:String)throws -> Double {
    if prixHT < 0 {
        fatalError("Le prix ne peut pas etre negatif")
    }
    var somme = prixHT
    
    //"TVA2", "tva5", "tva20"
    switch typeTVA.lowercased() {
    case "tva2":
        somme += (prixHT*0.02)
    case "tva5":
        somme += (prixHT*0.05)
    case "tva20":
        somme += (prixHT*0.20)
    default:
        throw ErreursTVA.ErreurTypeTVA("Type de TVA inconnu: \(typeTVA)")
    }
    return somme
}

//definir une enumeration contenant les types d'exception que la func precedentes pourrai trigger (declencher)

enum ErreursTVA: Error {
    case ErreurTypeTVA(String)
}

//appel
do{
    try calculer2(prixHT: 100, typeTVA: "tva1")
}catch ErreursTVA.ErreurTypeTVA(let leMessageErreur){
    print(leMessageErreur)
}

//utiliser les 2 types definis par les 2 func precedentes
//definir une var ayant le type defini par la fct calculer2
var vCalculeTva:(Double, String) -> Double? = calculer

//utiliser cette var
var ht = 1000.0
//executer la fct contenu dans la var et afficher la valeur calculer
print("Prix HT: \(ht), PrixTTC: \(vCalculeTva(ht,"tva2")!)")

//utiliser un type de fct comme type de param d'une autre fct
func calculerAfficherTTC20(_ ht:Double,
                           _ maFct: (Double,String)->Double?)->Double{
    let res = maFct(ht,"TVA20")
    print("Prix Ht: \(ht), PrixTTC20: \(res!)")
    return res!
}

//utiliser cette methode
calculerAfficherTTC20(500, vCalculeTva) //avec la variable
calculerAfficherTTC20(500, calculer)    //directement avec le nom de la fct

//utiliser le type defini par une fonctionnaire comme type de retour d'une

//commençons apr définir 4 fonctions de calcul
func additionner(v1:Double, v2:Double) -> Double {
    return v1 + v2
}
func soustraire(v1:Double, v2:Double) -> Double {
    return v1 - v2
}
func multiplier(v1:Double, v2:Double) -> Double {
    return v1 * v2
}
func diviser(v1:Double, v2:Double) -> Double {
    return v1 / v2
}

//toutes ces fct ont le meme type de retour (Double,Double)->Double
//definir mnt une fct capable de retourner une des 4 fct precedentes

//func choisirFct(fct:String)->(Double,Double)->Double
//si on veut tenir compte que l'on ne veut retourner des fct que pour les operateur '+-*/', il faut prevoir un type de retour capable de contenir nil (un optional)
func choisirFct(operateur:String)->((Double,Double)->Double)?{
    switch operateur {
    case "+":
        return additionner
    case "-":
        return soustraire
    case "*":
        return multiplier
    case "/":
        return diviser
    default:
        return nil
    }
}
//var qui recevra le retour de choisirFct
var vMaFct: ((Double,Double)->Double)? = choisirFct(operateur: "+")
vMaFct!(1,2)
print("1 + 2 = \(vMaFct!(1,2))")
print("1 + 2 = \(choisirFct(operateur: "+")!(1,2))")

//fct imbriquer
//les fonctions definie et utiliser plus haut sont toutes globale
//mais on peut definir des fct imbriquer dans d'autre fct (nested fct) avec un scope restraint a la fct la contenant
//une nested fct capture l'environnement dez la fct hote (acces au valeur locales de l'hote)

func getFctCalcul(_ operateur:String)->((Double,Double)->Double)?{
    var etiquette = "resultat: "
    var afficherRes = true
    
    func plus(v1:Double, v2:Double) -> Double {
        let res = v1 + v2
        if afficherRes {
            print("\(etiquette)\(v1) + \(v2) = \(res)")
        }
        return res
    }
    
    func moins(v1:Double, v2:Double) -> Double {
        let res = v1 - v2
        if afficherRes {
            print("\(etiquette)\(v1) - \(v2) = \(res)")
        }
        return res
    }

    func multiplie(v1:Double, v2:Double) -> Double {
        let res = v1 * v2
        if afficherRes {
            print("\(etiquette)\(v1) * \(v2) = \(res)")
        }
        return res
    }

    func divise(v1:Double, v2:Double) -> Double {
        let res = v1 / v2
        if afficherRes {
            print("\(etiquette)\(v1) / \(v2) = \(res)")
        }
        return res
    }

    switch operateur {
    case "+":
        return plus
    case "-":
        return moins
    case "*":
        return multiplie
    case "/":
        return divise
    default:
        return nil
    }
}

//tentative d'utiliser fct imbriquer directement
//vMaFct = plus

//recuperer fct imbriquer a l'aide de sa fct conteneur
vMaFct = getFctCalcul("+")
print("5 + 3 = \(vMaFct!(5,3))")
print("5 + 3 = \(getFctCalcul("+")!(5,3))")

