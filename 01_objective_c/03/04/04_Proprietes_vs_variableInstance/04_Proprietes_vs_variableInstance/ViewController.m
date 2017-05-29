//
//  ViewController.m
//  04_Proprietes_vs_variableInstance
//
//  Created by etudiant on 4/12/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Personne.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // créer une personne
    Personne * personne1 = [[Personne alloc]init];
    
    //donner un nom et un prenom à cette personne
    //en utilisant soit
    //- soit la propriété directement
    //- soit son setter
    personne1.nom = @"Van Damme";
    
    // le setter
    [personne1 setPrenom:@"Jean Claude"];
    
    //est-ce que je peux utiliser aussi la variable d'instance
    //_nom (ou _prenom) pour lire/ecrire la valeur
    //personne1._nom = @"xxx"; NON!!!
    //On constate que la variable d'instance utilisé par la propriété n'est pas accessible à l'extérieur de la classe
    //meme chose pour la variable d'instance'estMarié'
    
    //utiliser la methode 'tester'
    
    [personne1 tester];
    Personne * personne2 = [[Personne alloc]init];
    [personne2 testerAvecInitialisation];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
