//
//  Voiture.h
//  15_attribuesDesPropriete
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
//Comme la classe Emplaye n'a pas encore été définit je ne paux pas utiliser l'import suivant:
//#import "Employe.h"

//On peut utiliser à la place la directive suivante:
@class Employe;
@interface Voiture : NSObject

//@property (nonatomic,strong)Employe * proprietaire;
//'nonatomic' et 'Strong' font parti des attributs possibles qui précisent les caractéristique d'une propriété.
//nonatomic : laisse utiliser cette propiété par plusieurs thread en meme temps
//Strong: précise que la référence sur l'employé est forte ce qui implique la l'objet employé référencé ne peut pas etre supprimé tant que l'objet voiture existe

//Pour éviter les réferences circulaire(ritain cycle) entre l'employé et la voiture(qui empeche la suppression de la memoire de leurs instances devenues inutiles),je remplace l'attribut 'strong' par 'weak'
//L'objet référence par une référence 'weak' peut etre supprimé de la memoire
@property (nonatomic,weak)Employe * proprietaire;
@end
