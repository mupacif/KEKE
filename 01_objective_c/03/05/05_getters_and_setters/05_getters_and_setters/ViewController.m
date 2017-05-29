//
//  ViewController.m
//  05_getters_and_setters
//
//  Created by etudiant on 4/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Automobile.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Automobile * automobile = [Automobile new];//[[Automobile alloc] init];
    automobile.odometre = 10000;
    NSLog(@"Le kilométrage de votre voiture : %li",automobile.odometre);
    
    automobile.odometre = 5000;
    NSLog(@"Le kilométrage de votre voiture : %li",automobile.odometre);
    
    automobile.modele = @"Renault Twingo";
    NSLog(@"Vous roulez en %@ ",automobile.modele);
    
    automobile.modele = @"Aston Martin DB10";//le setter sera demandé implicitement
    NSLog(@"Votre voiture : %@ ",automobile.modele);//le getter sera demandé implicitement
    
    [automobile setOdometre:12000];//utilisation explicite du setter
    NSLog(@"Le kilométrage de votre voiture : %li",[automobile odometre]);//utilisation explicite du getter
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
