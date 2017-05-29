//
//  Utils.m
//  14_EchangeServeur
//
//  Created by etudiant on 4/26/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "Utils.h"

@implementation Utils
+(NSString*)objectToJson:(id)object{
    NSError* error;
    NSData *jsonData;
    @try {
        jsonData = [NSJSONSerialization dataWithJSONObject:object
                                        options:NSJSONWritingPrettyPrinted
                                          error:&error];
        //la transformation a reussi ?
        if (error != nil) {
            NSLog(@"Une erreur a été rencontrer\n%@",error);
            return nil;
        }
        //transformer les codes contenu dans l'objet jsonData en chaine de caractere
        NSString* jsonString = [[NSString alloc] initWithData:jsonData
                                                     encoding:NSUTF8StringEncoding];
        return jsonString;
    } @catch (NSException *exception) {
        NSLog(@"%@",exception.name);
        NSLog(@"%@",exception.reason);
        NSLog(@"Seulement les dictionnaire et tableau de dictionnaire sont jsonifiable");
        return nil;
    }
    return nil;
}
@end
