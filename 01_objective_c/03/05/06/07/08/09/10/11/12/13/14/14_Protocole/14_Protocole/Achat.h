//
//  Echat.h
//  14_Protocole


#import <Foundation/Foundation.h>
#import "Pimposable.h"
@interface Achat : NSObject <Pimposable>

-(id)initAvecPrixHT:(float)prixHT etTypeTVA:(NSString*)typeTVA;
@end
