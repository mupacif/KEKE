//indexeur (subscripts)
//les classes, structure et enum peuvent definir des indexeur
//c'est un mecanisme qui permet d'utiliser la synthax [index] sur une instance

//les indexeurs sont creer en swift a l'aide d'un binome get set

//synthax generale (si pas de set on peut abreger sans le mot clef get
/*
 subscript(index: TypeIndex) -> Type Retour{
    get{
 
    }
    set{
 
    }
 }
 */

class Personne {
    var nom = ""
    var anneeNaissance = 0
    //proposer un indexeur en lecture seul qui fournit
    //- annee de l'aquisition du bac
    //- anne de licence
    //- anne de maitrise
    //index utiliser = String
    //si mauvais index retourn nil
    subscript(idx:String)->Int?{
        switch idx{
        case "bac":
            return anneeNaissance + 18
        case "licence":
            return anneeNaissance + 21
        case "maitrise":
            return anneeNaissance + 23
        default:
            return nil
        }
    }
    
}

var p = Personne()
p.nom = "Macron"
p.anneeNaissance = 1978

p["bac"]
p["doctorat"]

if let anneeDoctorat = p["doctorat"] {
    print("\(anneeDoctorat)")
} else {
    print("echec recup")
}

if let anneeDoctorat = p["maitrise"] {
    print("\(anneeDoctorat)")
} else {
    print("echec recup")
}