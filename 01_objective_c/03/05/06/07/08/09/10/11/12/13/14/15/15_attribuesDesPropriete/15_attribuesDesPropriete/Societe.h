//
//  Societe.h
//  15_attribuesDesPropriete
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Employe;

@interface Societe : NSObject

/*
//@property(nonatomic,strong) Employe * employe;

@property(nonatomic,strong,getter=lireNom,setter=ecrireNom:)NSString * nomSociete;

-(void)configureSociete;
*/

-(void)configurerSociete;

@property (nonatomic, strong) Employe* employe;
@property(nonatomic,strong,getter=lireNom,setter=ecrireNom:)NSString * nomSociete;
@end
