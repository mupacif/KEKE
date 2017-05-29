//init

//avant de pouvoir les utiliser, les instance des struc et classes doivent etre init
//cad proprieter non optionnal doit avoir valeur
//soit avec valeur par defaut soit avec init

//initialisateur s'appel avec init, pas de valeur de retour, pas preceder par le mot func, 0 ou plusieur arguments, peut etre surcharger, s'appelle automatiquement et indirectement lors de la creation

//init designer = appele pas d'autre init
//init de convenience = appele d'autre init

struct Velo {
    var nbRoues: Int
    var vitesse = 18
    
    init() {
        nbRoues = 2
    }
    //etiquette pour utiliser meme nom de var
    init(roueRonde nbRoues: Int) {
        self.nbRoues = nbRoues
    }
    init(roueCarrer nbRoues: Int) {
        self.nbRoues = nbRoues * 2
    }
    init(vitesse: Int) {
        self.vitesse = vitesse
    }
    //pour reutiliser un autre init
    convenience init(roueCarrer nbRoues: Int, vitess: Int) {
        self.init(roueCarrer: nbRoues)
        self.init(vitesse: vitess)
    }
}
var velo = Velo()
velo.nbRoues
velo.vitesse
var velo2 = Velo(roueRonde: 8)
velo2.nbRoues
velo2.vitesse
var velo3 = Velo(roueCarrer: 8)
velo3.nbRoues
velo3.vitesse
var velo4 = Velo(roueCarrer: 8, vitess: 45)
velo4.nbRoues
velo4.vitesse
