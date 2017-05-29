//
//  Personne.m
//  04_Proprietes_vs_variableInstance
//
//  Created by etudiant on 4/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "Personne.h"

@implementation Personne

-(void)testerAvecInitialisation
{
   //utiliser la propriété 'nom' éecriture
    self.nom = @"Pierre";
    
    //utiliser la variable d'instance crée par le compilateur
    _nom = @"Cecile";
    //utiliser le setter
    [self setNom:@"Durand"];
    
    //on peut définir une variable local ayant le meme nom que la propriété
    //Initialisons la avec la valeur de la propriété recupere avec son getter
    NSString * nom = [self nom];
    //Remarque : j'aurais pu utiliser
    // NSString * nom = self.nom;
    
    //initialiser la variable d'instance 'estMariée'
    estMariée = NO;
    
    //une variable d'instance n'a pas de setter/getter
    
    //pas de setter:
    //[self setEstMariée]
    
    
    self.prenom = @"Anne";
    NSLog(@"self.nom: %@, self.prenom: %@, estMariée: %i, variable local nom: %@",self.nom,self.prenom,estMariée,nom);
    
}
-(void)tester
{
NSLog(@"self.nom: %@, self.prenom: %@, estMariée: %i",self.nom,self.prenom,estMariée);
}
@end
