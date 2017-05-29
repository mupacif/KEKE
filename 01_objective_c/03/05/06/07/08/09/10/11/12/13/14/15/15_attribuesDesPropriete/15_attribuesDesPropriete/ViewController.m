//
//  ViewController.m
//  15_attribuesDesPropriete
//
//  Created by etudiant on 4/18/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Societe.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Societe * societe = [[Societe alloc]init];
    [societe ecrireNom:@"Ma société"]; //Rappel: on a changer le nom du setter
    NSLog(@"Le nom de la société : %@",[societe lireNom]);
    
    [societe configurerSociete];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
