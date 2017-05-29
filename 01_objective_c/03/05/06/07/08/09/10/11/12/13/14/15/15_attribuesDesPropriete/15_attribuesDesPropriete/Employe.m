//
//  Employe.m
//  15_attribuesDesPropriete
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "Employe.h"

@implementation Employe

{
    //un autre champ d'instance (privé cette fois)
    NSString * prenom;
    
}

//Le nom de la variable sur laquelle s'appuie la propriété 'voiture' est _voiture
//Si on veut changer cela, on utilise la directive
@synthesize voiture = une_voiture;
-(void)configurerEmploye
{
    self.voiture = [[Voiture alloc]init];
    
    //si on veut utiliser le champ d'instance de la proprieté 'voiture':
    une_voiture = [[Voiture alloc]init];
    //configurer la voiture (c'est à dire préciser son propriétaire)
    //self.voiture.proprietaire = self;
    une_voiture.proprietaire = self;
    
    nom = @"Dupont";
    prenom = @"Marie";
}

//Pour savoir à quel moment l'employé a été supprimé de la
//mémoire j'overraide 'dealloc'

-(void)dealloc
{
    NSLog(@"L'employe %@ %@ a été supprimé de la mémoire",nom,prenom);
}
@end
