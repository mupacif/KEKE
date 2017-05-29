//
//  ViewController.m
//  13_initialisateur
//
//  Created by etudiant on 4/14/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Personne.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //tentative d'utilisation de l'initialisateur sans  'init'
    @try
    {
        //Personne * p1 = [[Personne alloc]init];
        // il existe un raccourci pour l'enchainement alloc/init
        Personne * p2 = [Personne new];
        
        //Attention la methode 'new' utilise toujours l'initialisateur sans argument (ce qui limite son interet)
        
    } @catch (NSException *exception)
    {
        NSLog(@"L'utilisation de l'initialisateur sans arhument est interdite");
        NSLog(@"%@",exception.reason);
    }
    
    Personne * p3 = [[Personne alloc]initAvecNom:@"Durand" etAvecPrenom:@"Pierre"];
    [p3 afficherInfos];
    
    Personne  * p4 = [[Personne alloc]initAvecAnneeNaissance:2017];
    [p4 afficherInfos];
    
    Personne  * p5 = [[Personne alloc]initAvecCivilite:2
                                               avecNom:@"Martin" evecPrenom:@"Marie" etAvecAnneeNaissance:1990];
    [p5 afficherInfos];
    Personne * p6 = [[Personne alloc]initAvecNom:@"D" etAvecPrenom:@"Pierre"];
    if(p6 != nil)
        [p6 afficherInfos];
    else
        NSLog(@"p6 n'a pas été crée");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
