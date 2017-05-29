//
//  ViewController.m
//  12_heritage
//
//  Created by etudiant on 4/14/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Vehicule.h"
#import "VehiculeHybride.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Vehicule * ve = [[Vehicule alloc]init];
    ve.marque = @"Ason Martin";
    
    //on peut aussi utiliser les setter
    [ve setModele : @"DB10"];
    //ve.modele = @"DB10";
    ve.cylindree = 6000;
    
    //Afficher le contenu de l'objet avec la méthode 'description'
    NSLog(@"%@",[ve description]);
    
    //l'appel explicit de la méthode 'description' n'est pas obbligatoire:
    NSLog(@"%@",ve);
    NSLog(@"Vitesse maximum sur autoroute :%.0f",ve.vMaxAutoroute);
    
    //tentative échouée de mofification de vMaxAuto
    //qui est une propriété readonly
    //ve.VmaxAutorute = 150;
    
    //tentative échouée d'appeler la methode 'accelerer'
    //[ve accelerer:20];
    
    [ve conduire];
    
    VehiculeHybride * vh = [[VehiculeHybride alloc]init];
    vh.marque = @"Tesla";
    vh.modele = @"S";
    vh.cylindree = 2000;
    vh.puissanceMoteurElectique = 30;
    
    NSLog(@"%@",vh);
    
    //exécuter 'tester'
    [vh tester];
    
    Vehicule * ve2 = vh;
    //le compilateur m'empece d'utiliser la methode 'tester' d'un vehicule hybride..
    //[ve2 tester];
    NSLog(@"%@",[ve2 description]);
    
    //si on veut malgré tout appeler la méthode tester seu ve2,
    //au moment du runtime, je dois utiliser un selecteur
    SEL monSelecteur = NSSelectorFromString(@"tester");
    //exécuter le sélecteur
    [ve2 performSelector:monSelecteur];
    
    //lancer aussi avec ve dans ve2 à la place de vh
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
