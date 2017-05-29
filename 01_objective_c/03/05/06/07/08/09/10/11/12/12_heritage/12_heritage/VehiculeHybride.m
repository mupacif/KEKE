//
//  VehiculeHybride.m
//  12_heritage
//
//  Created by etudiant on 4/14/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "VehiculeHybride.h"

@implementation VehiculeHybride

//ovverrider l'initialisateur
-(id)init
{
    if(self =[super init])
    {
        NSLog(@"Le super init a réussi");
        self.puissanceMoteurElectique = 20;
    }
    return self;
}

//implémenter 'tester'
-(void)tester
{
    NSLog(@"Je vérifie l'état des batteries");
    [self conduire];
}

//overrider la méthode héritée 'conduire'
-(void)conduire
{
    NSLog(@"Je charges les batteries");
    [super conduire];
    NSLog(@"et %.0f KW",self.puissanceMoteurElectique);
}

//overrider la méthode description
-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ et %.0f KW",[super description],self.puissanceMoteurElectique];
    
}
@end
