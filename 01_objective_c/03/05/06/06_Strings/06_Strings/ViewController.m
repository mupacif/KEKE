//
//  ViewController.m
//  06_Strings
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

    // créer un String
    NSString * prenom = @"Marie";
    
    //la variable prenom ne contient pas le string litéral mais l'adresse de l'objet crée à partir de ce string literal
    
    //Effectivement si je donne cette variable à la fonction NSLog,le compilateur affiche un avertissement.Pourquoi?
    //Parce que Nslog() demande un 1er argument de type 'string literal'
    
    NSLog(@"%@", prenom);
    
    //NSString est une classe
    //On peut donc utiliser l'enchainement alloc/init
    NSString * chaineVide = [[NSString alloc]init];
    //ceci est l'équivalent de
    //NSString * chaineVide = @"";
    NSLog(@"chaineVide: %@",chaineVide);
    
    // concaténation des chaines methode de classe stringWithformat
    NSString * nomComplet = [NSString stringWithFormat:@"%@ Duran",prenom];
    
    NSLog(@"nomComplet: %@",nomComplet);
    
    //concaténer 3 chaines de caractéres
    nomComplet = [NSString stringWithFormat:@"%@ Durand %@", prenom,@"Cecile"];
    
    NSLog(@"nomComplet: %@",nomComplet);
    
    //2e possibilité
    NSString * chaineResultat = [nomComplet stringByAppendingString:@"- employer chez Apple"];
    
    NSLog(@"Employé et société: %@", chaineResultat);
    
    //comparaison des chaines
    //l'opérateur == ne tester pas l'egalité du contenu de 2 chaines(il teste l'egalité des références)
    NSString * formation1 = @"Swift";
    NSString * formation2 = @"Swift";
    
    if(formation1 == formation2)
        NSLog(@"Le variables 1 et 2 sont égales");
    else
        NSLog(@" sont pas  égales");
    
    //Pour comparer le contenu des chaines, on n'utilise pas == mais des méthodes spécialisées
    if([formation1 isEqualToString:formation2])
        NSLog(@"Le variables 1 et 2 contiennent des chaines identique");
    else
        NSLog(@" ont des chaine differentes");
    //La comparaison est sensible à la caste
    formation2 = @"swift_";
    
    if([formation1 isEqualToString:formation2])
        NSLog(@"Le variables 1= '%@' et 2= '%@' contiennent des chaines identique",formation1,formation2);
    else
        NSLog(@"Le variables 1= '%@' et 2= '%@' ont des chaine differentes",formation1,formation2);
    
    //Si on veut rendre la comparaison non case sensitive
    //on a 2 solution
    
    //Exercice:
    //Mettre en oeuvre les 2 solutions
    //- utiliser le passage en miniscules ou Majuscules
    //- utiliser une fonction spécialisé de NSString
    
    //Exercice2
    //- etudier la facon dont on peut extraire une sous-chaine à partir d'une chaine en précisant les limites d'extraction
    //-donner un exemple d'utilisation de la longueur d'une chaine
    //-étudier la facon dont on peut remplacer une sous-chaine(d'une chaine) par une autre souschaine
    //-trouver l'équivalent de la méthode pour trouver toutes les occurences d'une sous-chaine
    
    
    // 1) Transformation en uppercase
    NSString * formation1_uppercase = [formation1 uppercaseString];
    NSString * formation2_uppercase = [formation2 uppercaseString];
    
    if([formation1_uppercase isEqualToString:formation2_uppercase])
        NSLog(@"Le variables 1= '%@' et 2= '%@' contiennent des chaines identique",formation1,formation2);
    else
        NSLog(@"Le variables 1= '%@' et 2= '%@' ont des chaine differentes",formation1,formation2);
    
    // 2) Avec function spécialisé
    NSLog(@"%li",[formation2 caseInsensitiveCompare:formation1 ]);
    if([formation2 caseInsensitiveCompare:formation1 ]==0)

        NSLog(@"Le variables 1= '%@' et 2= '%@' egale",formation1,formation2);
    else
        NSLog(@"Le variables 1 2 non egale");
    

    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
