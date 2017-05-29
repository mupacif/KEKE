//
//  Personne.h
//  13_initialisateur
//
//  Created by etudiant on 4/14/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Personne : NSObject

@property (nonatomic)int civilite;
@property (nonatomic,strong) NSString * nom;
@property (nonatomic,strong) NSString * prenom;
@property (nonatomic) int  anneeNaissance;

//definir les initialisateurs à exporter
//le nom d'une initialisateur doit commencer par 'init'
-(id)initAvecNom:(NSString *)nom etAvecPrenom:(NSString*)prenom;
-(id)initAvecAnneeNaissance:(int)anneeNaissance;
-(id)initAvecCivilite:(int)civilite avecNom:(NSString *)nom
           evecPrenom:(NSString *)prenom etAvecAnneeNaissance:(int)anneNaissance;
-(void)afficherInfos;
@end
