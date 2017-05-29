//methode
//une methode est une fct attacher a une instance ou a un type (struct, enum ou class)

//on distingue
//- des methodes d'instabnce - appartient a l'instance
//- des methode de type - appartient au type

class Vehicule {
    var vitess = 0
    
    func accelerer() {
        vitess += 1
    }
    
    func accelerer(avec vitess: Int) {
        self.vitess += vitess
    }
    
    func arreter() {
        vitess = 0
    }

}

var velo = Vehicule()
velo.accelerer(avec: 10)
print(velo.vitess)
velo.accelerer()
print(velo.vitess)
velo.accelerer()
print(velo.vitess)

enum Formation:String{
    case java, swift, objC, cdva
    
    //pour modif une valeur immutable on utilise mutating func
    mutating func formationSuivante() {
        switch self {
        case .java:
            self = .swift
        case .swift:
            self = .objC
        case .objC:
            self = .cdva
        case .cdva:
            self = .java
        default:
            break
        }
    }
}

var formation = Formation.swift
formation.formationSuivante()
formation.formationSuivante()
formation.formationSuivante()
formation.formationSuivante()
formation.formationSuivante()
formation.formationSuivante()

struct MonPoint {
    var x:Int
    var y:Int
    
    mutating func deplacer(dx:Int, dy:Int){
        x += dx
        y += dy
    }
    
    mutating func remplacer(dx:Int, dy:Int){
        self = MonPoint(x: x + dx,y: y + dy)
    }
}

var unPoint = MonPoint(x:3,y:5)
unPoint.deplacer(dx: 10, dy: 11)

struct Automobile {
    static var vMaxRing = 70{
        willSet{
            print("La valeur \(vMaxRing) de vMaxRing sera changer par \(newValue)")
        }
        didSet{
             print("La valeur \(oldValue) de vMaxRing a ete remplacer par \(vMaxRing)")
        }
    }
    var vitess: Int
    
    static func modifierVMaxRing(_ vMax:Int){
        Automobile.vMaxRing = vMax
    }
    
    //annotation pour si on recuyp pas tjs la valeur de retour
    @discardableResult
    mutating func surveillerVitesse() -> Int {
        if vitess > Automobile.vMaxRing {
            vitess = Automobile.vMaxRing
        }
        return vitess
    }
}

var auto = Automobile(vitess: 50)
print("vMaxRing: \(Automobile.vMaxRing)")
Automobile.modifierVMaxRing(120)
auto.surveillerVitesse()