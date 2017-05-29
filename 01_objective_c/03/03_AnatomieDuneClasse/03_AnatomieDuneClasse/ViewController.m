//
//  ViewController.m
//  03_AnatomieDuneClasse
//
//  Created by etudiant on 4/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

/*
 Entre @interface et @end je peux définir 
 -des propriétes
 -des methodes
 qui ne seront pas visible à l'exterieure de la classe
 */
@interface ViewController () // extension

@property(nonatomic,strong) NSString * automobile;
@end

/*
 Entre @implementation et @end on donne les méthode qui assurent les fonctionnalités de la classe
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //afficher la propiété 'nom'
    NSLog(@"La valeur de la proprieté 'nom' avant initialisation est:%@ %@ %@",self.nom, _nom,[self nom]);
    //Le format %@ est utiliser pour les objets(variables reference)
    //Remarque :j'ai utilisé 3 facons differents d'accéder à la valeur de la propriété :
    //-utiliser la propriété elle meme
    //-utiliser la variable d'instance sur laquelle la propriété réponse
    //-utiliser le getter
    //donner une valeur à la propriété 'nom'
    //J'ai aussi 3 possibilités:
    // 1. j'utilise la propriété elle meme
    self.nom = @"Pierre";
    NSLog(@"La valeur de la proprieté 'nom' apres la premiere initialisation est:%@ ",self.nom);
    
    //2. utiliser la variable d'instance de la propriété
    _nom = @"Marie";
    NSLog(@"La valeur de la proprieté 'nom' apres la deuxiemme initialisation est:%@ ",_nom);
    
    //3. utiliser la variable d'instance de la propriété
    [self setNom:@"Philippe"];
    
    NSLog(@"La valeur de la proprieté 'nom' apres la troixiemme initialisation est:%@ ",_nom);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
