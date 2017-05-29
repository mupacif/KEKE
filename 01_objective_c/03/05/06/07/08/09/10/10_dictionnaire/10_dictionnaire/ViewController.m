//
//  ViewController.m
//  10_dictionnaire
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
    //création et initialisation d'une dictionnaire non mofifiable
    //avec un 'literal syntax'
    NSDictionary * couleursRGB = @{
                                   @"rouge":@"ff0000",
                                   @"vert":@"00ff00",
                                   @"bleu":@"0000ff",
                                   @"magenta":@"ff00ff",
                                   @"blanc":@"ffffff"
                                   };
    NSMutableDictionary * personnes = @{
                                        @"pierre": [NSNumber numberWithInt:20],
                                        @"marie": @20,
                                        //techniquement on peut changer le type de la clé ou de la valeur mais ceci n'est pas conseillé
                                        @"louise": @"dupont",
                                        @"philippe" : @25
                                        }.mutableCopy;
    
    //comme mutableCopy est une méthode il sérait correct d'utiliser
    personnes = [@{
                  @"pierre": [NSNumber numberWithInt:20],
                  @"marie": @20,
                  @"louise": @"dupont",
                  @"philippe" : @25
                  } mutableCopy];
    NSLog(@"%@",[personnes debugDescription]);
    
    // une autre facon de créer un dictionnaire mutable en utilisant un 'literal syntax'
    personnes = [NSMutableDictionary dictionaryWithDictionary:@{
                                                    @"pierre": [NSNumber numberWithInt:20],
                                                    @"marie": @20,
                                                    @"louise": @"dupont",
                                                    @"philippe" : @25
                                                    }];
//on peut aussi créer un NSMutableDictionary vide et inséréer les binomes aprés
    personnes = [[NSMutableDictionary alloc] init];
    [personnes setObject:[NSNumber numberWithInt:20] forKey: @"pierre"];
    [personnes setObject:@20 forKey: @"marie"];
    [personnes setObject:@"dupont" forKey: @"louise"];
    [personnes setObject:@25 forKey: @"philippe"];
    
    //si on dépose à la meme clé un autre objet le 2em objet remplacera le 1er
    [personnes setObject:@40 forKey: @"marie"];
    NSLog(@"%@",[personnes debugDescription]);
    
    //récupérer une valeur attachée à une clé:
    int age = [[personnes objectForKey:@"marie"] intValue];
    
    //si la clé est une chaine de caractéres, on peut aussi utiliser la méthode valueForKey
    age = [[personnes valueForKey:@"marie"] intValue];
    NSLog(@"L'age de Marie :%i",age);
    NSArray * tbCles = [personnes allKeys];
    NSLog(@"Le dictionnaire 'personne' contient %lu cles :",(unsigned long)tbCles.count);
    for(NSString * cle in tbCles)
    {
        NSLog(@"%@",cle);
    }
    //récupere toutes les valeurs:
    NSArray * tbValeurs = [personnes allValues];
    NSLog(@"Le dictionnaire 'personne' contient %lu valeurs ",(unsigned long)tbValeurs.count);
    
    for(NSString * valeur in tbValeurs)
    {
        NSLog(@"%@",valeur);
    }
    
    //si je veux "afficher" a l'age de chaque personne 3 ans
    for(NSString * valeur in tbValeurs)
    {
        //tester le type de la valeur courante
        if([valeur isKindOfClass:[NSString class]] )
            NSLog(@"Valeur chaine: %@", (NSString *)valeur);
        else if([valeur isKindOfClass:[NSNumber class]] )
            NSLog(@"Valeur chaine: %i", [(NSNumber *)valeur intValue] + 3);
    }
    
    //créer et utiliser une méthode afficherContenuDictionnaire, avec un argument
    //contenant le dictionnaire à afficher
    
    [self afficherContenuDictionnaire: personnes];
}


-(void)afficherContenuDictionnaire : (NSMutableDictionary*) tbPersonne
{
    for(NSString * valeur in tbPersonne)
    {
        NSLog(@"cles :%@ valeur :%@",[tbPersonne valueForKey:valeur],valeur);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
