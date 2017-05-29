//
//  Utils.m
//  09_MapView
//
//  Created by etudiant on 4/25/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "Utils.h"

@implementation Utils
+(void)afficherAlerteAvecTitre:(NSString*)titre etMessage:(NSString*)message etParent:(UIViewController*)controller
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"titre"
                                                                    message:message
                                                             preferredStyle:UIAlertControllerStyleAlert];
    
    //définir un bouton pour fermer l'alerte
    UIAlertAction * actionFermeture = [UIAlertAction actionWithTitle:@"Fermer"
                                                               style:UIAlertActionStyleCancel
                                                             handler:nil];
    //attacher le bouton a l'alerte
    [alert addAction:actionFermeture];
    
    //afficher l'alerte
    [controller presentViewController:alert
                       animated:YES
                     completion:nil];
}

@end

