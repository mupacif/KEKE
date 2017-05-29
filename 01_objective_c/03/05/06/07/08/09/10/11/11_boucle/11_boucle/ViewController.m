//
//  ViewController.m
//  11_boucle
//
//  Created by etudiant on 4/14/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   NSArray * voitures = @[@"Aston Martin DB10",
                         @"Bougatti Veyron",
                         @"Hennessey Venom",];
    
    NSLog(@"Mes voitures de collection : ");
    for(int i = 0;i < voitures.count; i++)
    {
        NSString * voiture = [voitures objectAtIndex:i];
        NSLog(@"%@",voiture);
    }
    NSLog(@"Mes voitures avec for etendu : ");
    for(NSString * voiture in voitures)
    {
        NSLog(@"%@",voiture);
    }
    NSLog(@"Mes voitures avec boucle while");
    //crée un objet capable de passer d'une élément à un autre
    //Un tel objet est un enumérateur
    NSEnumerator * enumerateur = [voitures objectEnumerator];
    id element;
    while((element = [enumerateur nextObject]) != nil)
    {
        NSLog(@"%@",element);
    }
    
    NSLog(@"Mes voitures avec boucle do while");
    enumerateur = [voitures objectEnumerator];
    element = [enumerateur nextObject];
    do
    {
        NSLog(@"%@",element);
        
    }while((element = [enumerateur nextObject]) != nil);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
