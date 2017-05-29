//
//  Personne.h
//  04_Proprietes_vs_variableInstance
//
//  Created by etudiant on 4/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Personne : NSObject

// définir une variable d'instance
//les variables d'instance ne sont pas accesibles à l'exterieure de la classe
//On les définit entre 2 accolades:
{
    BOOL estMariée;
}
// 2 propriété publiques

@property (nonatomic,strong) NSString * nom;
@property (nonatomic,strong) NSString * prenom;

-(void)testerAvecInitialisation;
-(void)tester;
@end
