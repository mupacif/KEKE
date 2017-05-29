//
//  ViewController.m
//  07_numbers
//
//  Created by etudiant on 4/13/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // definir quelques variables type
    //(type primitif)
    int i = 23;
    float f = 13.123456789;
    double fd = 13.123456789;
    NSLog(@"int: %d, float: %.10f,double : %.20f",i,f,fd);
    
    //je ne peux pas crée un tableu pour stocker des variables type valeur
    //NSArray * tb = @[i, f, fd];
    
    //Effectivement ,les tableaux objective c ne peuvent contenir que des objets(des references)
    //On le fait en créant des objets de la classe NSNumber
    NSNumber * objInt = [NSNumber numberWithInt:i];
    NSNumber * objFloat = [NSNumber numberWithFloat:f];
    NSNumber * objDouble = [NSNumber numberWithDouble:fd];
    
   NSArray * tb = @[objInt, objFloat, objDouble];
    
    //pour récuper les valeur déposée dans un objet de type NSNumber on utilise des methodes comme
    int vi = objInt.intValue;
    float vf = objFloat.floatValue;
    double vd = objDouble.doubleValue;
    
    //pour sortir une chaine de caractére d'un NSNumber
    NSString * chaineFd = [objDouble stringValue];
    
    //des raccourcis pour créer des objets de type NSNumber
    NSNumber * monBool = @YES;
    NSNumber * monFloat = @13.13f;
    NSNumber * monEntier = @13;
    
    //Remarques:
    // 1) On ne peut pas stoquer le directement le résultat d'une expression
   // NSNumber * resultat = vi * vf;
    //Effectivement il faut passer par une méthode de fabrique
    NSNumber * resultat = [NSNumber numberWithFloat:vi*vf];
    
    // 2) Si on utilise une expression avec des valeurs directes, on peut faire appel à un litéral:
    NSNumber * r = @(13/3);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
