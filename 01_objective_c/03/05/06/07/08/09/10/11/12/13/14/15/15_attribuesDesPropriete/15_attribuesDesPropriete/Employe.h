//
//  Employe.h
//  15_attribuesDesPropriete
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Voiture.h"
@interface Employe : NSObject

{
    
    //champ d'instance rendu public à l'aide
    //d'un modificateur d'accés
    @public
    NSString * nom;
}

@property (nonatomic,strong)Voiture * voiture;

-(void)configurerEmploye;
@end
