//
//  Voiture.m
//  15_attribuesDesPropriete
//


#import "Voiture.h"

@implementation Voiture

//overrider la méthode 'dealloc'
//cette methode est appelée juste avant la suppression de l'objet de la mémoire

-(void)dealloc
{
    NSLog(@"La voiture a été supprimée de la mémoire");
}
@end
