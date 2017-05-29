//
//  ViewController.m
//  02_jeuQuestion
//
//  Created by etudiant on 4/11/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () //extension
{
    //définir un dictionnaire contenant les questions et réponses
    NSDictionary * dictionnaireQuestions;
    
    //définir un tableau que contenant les questions
    NSArray * tbQuestions;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
// créer et initialiser le dictionnaire
    dictionnaireQuestions = @{
                              @"Etes vous en stage ?":@"OUI",
                              @"Aimez vous objective C ?":@"OUI",
                              @"Allez vous etudier le longage swift ?":@"OUI",
                              @"C'est un stage Java ?":@"NON",
                              @"Objective C vous semble difficile ?":@"NON",
                              @"Swift est un langage Objective c like ?":@"NON"
                              
                              };//literal syntaxe
    
    //extraire les questions et les deposer dans un tableau
    tbQuestions = [dictionnaireQuestions allKeys];
}

- (IBAction)poserUneQuestion:(UIButton *)sender
{
    //je veux choisir une question au hazard
    //pour cela je dois tirer au hazard un valeur entiére qui sera utilisée comme index
    //dans le tableau de questions cette index doit etre contenu entre 0 et 5
    //pour obtenir une valeur entiére aléatoire on utilise la fonction global arc4random()
    //j'utilise aussi la fonction 'count' du tableau pour obtenir la taille du tableau
    //cette taille est utilisée ensuite a l'aide de modulo % pour obtenir des index de 0 a -1
    int index = arc4random() % [tbQuestions count];
    
    //recupere la question a afficher
    NSString * question = [tbQuestions objectAtIndex:index];
    
    //recupere la reponse correcte qui se trouve dans le dictionnaire
    NSString * reponseAttendue = [dictionnaireQuestions objectForKey: question];
    
    //alerte qui affiche la question
    UIAlertController * alerte = [UIAlertController
                                  alertControllerWithTitle:@"Question"
                                  message:question
                                  preferredStyle: UIAlertControllerStyleAlert];
    
    //definir les boutons de l'alerte et les actions à exécuter apres la fermeture de l'alerte
    
    UIAlertAction * actionBtnOui = [UIAlertAction
                                    actionWithTitle:@"OUI"
                                    style: UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        //bloc de code qui est exécuté juste aprés la
                                        //fermeture de l'alerte et qui doit vérifier la reponse
                                        
                                        [self verifierReponseDonnee:@"OUI" avecReponseCorrect:reponseAttendue];
                                    }];
    
    UIAlertAction * actionBtnNon = [UIAlertAction
                                    actionWithTitle:@"NON"
                                    style: UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        [self verifierReponseDonnee:@"NON" avecReponseCorrect:reponseAttendue];
                                    }];
    
    //attacher ces 2 boutons a l'alerte
    [alerte addAction:actionBtnOui];
    [alerte addAction:actionBtnNon];
    
    //afficher l'alerte
    [self presentViewController:alerte
                       animated:YES
                     completion:nil];
    
}

//créer la methode qui vérifie les réponses
- (void) verifierReponseDonnee: (NSString *)reponseDonnee avecReponseCorrect: (NSString *)reponseCorrecte
{
    //crée le message à afficher dont le contenu variera selon la pertinance de la réponse
    
    NSString * message;
    //analyser la réponse
    if([reponseDonnee isEqualToString: reponseCorrecte])
    {
       message = @"Votre réponse est correcte";
    }
    else
    {
        message = @"Votre réponse est erronée";
    }
    // Créer une alerte qui affichera ce message
    UIAlertController * alerte = [UIAlertController
                                  alertControllerWithTitle:@"Résultat"
                                  message:message
                                  preferredStyle: UIAlertControllerStyleAlert];
    
    // créer un seul bouton
    UIAlertAction * actionBntFermer = [UIAlertAction
                                    actionWithTitle:@"Fermer"
                                    style: UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action){}];
    
    //attacher le bouton a l'alerte
    [alerte addAction: actionBntFermer];
    
    //afficher l'alerte
    [self presentViewController:alerte
                       animated:true
                     completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
