//
//  Societe.m
//  15_attribuesDesPropriete
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "Societe.h"
#import "Employe.h"
@implementation Societe

-(void)configurerSociete
{
    self.employe = [[Employe alloc]init];
    [self.employe configurerEmploye];
    
    //la variable d'instance 'nom' de l'employé est visible car on la decorée avec @public
    
    NSLog(@"Nom: %@", self.employe->nom);
    
    //je veux supprimer l'employé de la mémoire
    //Rappel: je dois faire en sorte que l'employé ne soit plus référencé:
    self.employe = nil;
    
}
-(void)dealloc
{
    NSLog(@"La societe %@ a été supprimé de la mémoire",[self lireNom]);
}
@end
