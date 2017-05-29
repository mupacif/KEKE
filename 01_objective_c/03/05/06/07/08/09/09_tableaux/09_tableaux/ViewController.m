//
//  ViewController.m
//  09_tableaux
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
/*
 Pour utiliser des tableaux on fait appel aux classes
 -NSArray - définit des tableaux dont la taille est fix
 -NSMutableArray - définit des tableaux dont la taille peut croitre
 */
    
    NSArray * tb = [[NSArray alloc]init];
    
    //comme le tableau est immuable je ne peux pas passer de 0 élément à 1 élément
    
    //[tb addObject:@"Swift"]
    
    //afficher les informations (y compris le contenu) de ce tableau
    NSLog(@"%@", tb.debugDescription);
    
    //crée untb ayant des éléments données
    tb = [NSArray arrayWithObjects:@"élément 0",@"élément 1",@"élément 2",nil];
    NSLog(@"debugDescription %@", tb.debugDescription);
    NSLog(@"description %@", tb.description);
    
    [self afficherContenuTableau:tb];
    
    //NSMutableArray - tableau dont la taille peut etre agrandie
    NSMutableArray * tbm = [[NSMutableArray alloc]init];
    [tbm addObject:@"e0"];
    [tbm addObject:@"e1"];
    [tbm addObject:@"e2"];
    [tbm addObject:@"e3"];
    NSLog(@"Le contenu de tbm:");
    [self afficherContenuTableau:tbm];
    
    //inséré un élément à une position donnée
    [tbm insertObject:@"e1x" atIndex:1];
    
    NSLog(@"Le contenu de tbm apres insertion de 'e1x':");
    [self afficherContenuTableau:tbm];
    
    //modifier l'élément se trouvant à l'index 1
    [tbm replaceObjectAtIndex:1 withObject:@"e111"];
    
    NSLog(@"Le contenu de tbm apres remplacement de 'e1x'avec 'e111'");
    [self afficherContenuTableau:tbm];
    
    //supprimer l'element se trouvant à l'index 1
    [tbm removeObjectAtIndex:1];
    
    NSLog(@"Le contenu de tbm apres suppresion de l'element a la position 1");
    [self afficherContenuTableau:tbm];
    
    //supprimer un élément en précisant son contenu
    [tbm removeObject:@"e2"];
    
    NSLog(@"Le contenu de tbm apres suppresion de l'element");
    [self afficherContenuTableau:tbm];
    
    //in tableau NSMutableArray peut etre crée avec un ensemble de valeurs
    tbm = [NSMutableArray arrayWithObjects:@"a0",@"a1",@"a2", nil];
    NSLog(@"Le contenu du tableau crée avec un ensemble de valeurs");
    [self afficherContenuTableau:tbm];
    
    //Raccourci
    tbm = (NSMutableArray *)@[@"b0",@"b1",@"b2"];
    
    //essayon d'ajouter un élément dans ce tableau
    
    //Solution 1:
    //Créer le tableau en utilisant un table figé
    tbm = [NSMutableArray arrayWithArray:@[@"b0",@"b1",@"b2"]];
    
    //Solution 2:
    tbm = @[@"b0",@"b1",@"b2"].mutableCopy;
    
    //ou alors
    tbm = [@[@"b0",@"b1",@"b2"] mutableCopy];
    
}
-(void)afficherContenuTableau:(NSArray *)tb
{
    if(tb.count == 0)
        NSLog(@"Le tableau est vide");
    else
    {
        NSLog(@"le tableau contient %lu elements",(unsigned long)tb.count);
        for(int i =0;i<tb.count;i++)
        {
            NSLog(@"tb[%i]: %@",i,[tb objectAtIndex:i]);
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
