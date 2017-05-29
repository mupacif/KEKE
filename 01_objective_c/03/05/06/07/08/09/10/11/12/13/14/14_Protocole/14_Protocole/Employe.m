//
//  Employe.m
//  14_Protocole
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "Employe.h"


@implementation Employe

-(id)init
{
    NSAssert(false, @"Veuiller utiliser initAvecNomEtSalaire");
    return nil;
}
-(id)initAvecNom:(NSString*)nom etSalaire:(float)salaire
{
    self = [super init];
    if(self)
    {
        self.nom = nom;
        self.salaire = salaire;
    }
    return self;
}
-(float)calculerImpot //methode imposée par la conformité avec le protocole Pimposable
{
    float impot;
    
    float salaireAnnuel = self.salaire * 12;
    if(salaireAnnuel < 12000)
        impot = 0;
    else if (salaireAnnuel < 25000)
        impot = (salaireAnnuel - 12000) * 0.15f;
    else if (salaireAnnuel < 40000)
        impot = (25000 - 12000) * 0.15f + (salaireAnnuel - 25000) * 0.3f;
    else
        impot = (25000 - 12000) * 0.15f + (40000 - 25000) * 0.3f + (salaireAnnuel - 40000) * 0.5f;
    return  impot;
}

-(NSString*)nomImpot
{
    return @"Impot sur le revenu";
}

@end
