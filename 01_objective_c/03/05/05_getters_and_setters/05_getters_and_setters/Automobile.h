//
//  Automobile.h
//  05_getters_and_setters
//
/*
   Encapsulation: ensemble de technique qui séparent l'interieur d'un objet de l'extérieur
 */

#import <Foundation/Foundation.h>

@interface Automobile : NSObject

@property (nonatomic)long odometre;
@property(nonatomic,strong)NSString * modele;

@end
