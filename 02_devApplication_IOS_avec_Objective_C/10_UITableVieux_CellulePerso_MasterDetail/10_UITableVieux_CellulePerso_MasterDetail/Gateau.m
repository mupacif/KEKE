//
//  Gateau.m
//  10_UITableVieux_CellulePerso_MasterDetail
//


#import "Gateau.h"

@implementation Gateau

-(id)initNom:(NSString *)nom nomImage:(NSString *)nomImage description:(NSString *)description;
{
    if( self = [super init])
    {
        self.nomImage = nomImage;
        self.nom = nom;
        self.texte = description;
    }
    return self;
}
@end
