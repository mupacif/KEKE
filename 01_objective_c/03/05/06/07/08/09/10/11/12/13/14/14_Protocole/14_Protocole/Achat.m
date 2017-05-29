//
//  Echat.m
//  14_Protocole
//


#import "Achat.h"

@implementation Achat
{
    NSString * typeTVA;
    float prixHT;
}

-(id)initAvecPrixHT:(float)argprixHT etTypeTVA:(NSString*)argtypeTVA
{
    self = [super init];
    if(self != nil )
    {
        prixHT = argprixHT;
        typeTVA = argtypeTVA;
    }
    return self;
}

-(NSString*)nomImpot
{
    return @"TVA (Taxe sur la valeur ajouter)";
    
}
-(float)calculerImpot
{
    if([typeTVA.lowercaseString isEqualToString:@"tva0"])
        return 0;
    else if([typeTVA.lowercaseString isEqualToString:@"tva2"])
        return prixHT * 0.02f;
    else if([typeTVA.lowercaseString isEqualToString:@"tva5"])
        return prixHT * 0.055f;
    else if([typeTVA.lowercaseString isEqualToString:@"tva20"])
        return prixHT * 0.2f;
    else
        NSAssert(false, @"Type TVA erronée");
    return 0;
}

@end
