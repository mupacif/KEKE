//
//  Employe.h
//  14_Protocole
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Personne.h"
#import "Pimposable.h"

//Comme un employer est imposable sa classe doit etre conforme au protocole Pimposable

@interface Employe : Personne <Pimposable>

@property float salaire;

-(id)initAvecNom:(NSString*)nom etSalaire:(float)salaire;

@end
