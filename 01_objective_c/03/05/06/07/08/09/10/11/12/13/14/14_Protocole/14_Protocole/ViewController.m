//
//  ViewController.m
//  14_Protocole
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Personne.h"
#import "Employe.h"
#import "Achat.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //crée un tableau ou on deposera tous les objet crées
    NSMutableArray * registre = [[NSMutableArray alloc]init];
    Personne  * p = [Personne new];
    p.nom = @"Marie";
    NSLog(@"%@",p);
    [registre addObject:p];
    
    Employe * e = [[Employe alloc]initAvecNom:@"Pierre" etSalaire:2000];
    [registre addObject:e];
    Achat * a = [[Achat alloc]initAvecPrixHT:100 etTypeTVA:@"TVA20"];
    [registre addObject:a];
    
    //je veux calculer la recette du fisc
    float recette = 0;
    float impotItem;
    for(NSObject * item in registre)
    {
        //tester la conformité de l'objet courant avec le protocol imposable
        
        if([item conformsToProtocol:@protocol(Pimposable)])
        {
            impotItem = ((id <Pimposable>)item).calculerImpot;
            NSLog(@"Type impot: %@, montant: %f",((id <Pimposable>)item).nomImpot,impotItem);
            recette += impotItem;
        }
    }
    NSLog(@"La recette totale du fisc : %.2f",recette);
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
