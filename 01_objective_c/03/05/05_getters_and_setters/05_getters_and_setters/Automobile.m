//
//  Automobile.m
//  05_getters_and_setters
//


#import "Automobile.h"

@implementation Automobile
/*
 Filtrer les entrées(Les valeurs proposées pour l'odometre)
 
 Rappel: lors de la déclaration de la propriété,le compilateur a automatiquement crée un getter et un setter
 Mais ces 2 méthodes n'assurent pas l'encapsulation
 //Je vais donner moi meme le code du setter pour assurer cette séparation entre l'interieur et l'exterieur
 */

-(void)setOdometre:(long)kilometrage
{
//je ne veux pas reduire le nombre de km existant
    //La valeur de l'odometre ne peut qu'augmenter
    if(kilometrage > _odometre) //ici,je peux aussi utiliser self.odometre
    {
        _odometre = kilometrage;
    }
    NSLog(@"Nouvelle valeur de l'odométre : %li",_odometre);
}

-(NSString *)modele
{
    
    if([[_modele lowercaseString] isEqualToString:@"aston martin db10"])
        return @"Cette information est confidentielle";
    else
        return _modele;
}
@end
