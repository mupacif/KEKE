//
//  Personne.m
//  14_Protocole
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "Personne.h"

@implementation Personne

-(NSString*)description
{
    return [[NSString alloc]initWithFormat:@"%@ %@",[self class],self.nom];
}
@end
