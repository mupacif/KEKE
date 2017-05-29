//
//  ViewController.m
//  02_SizeClasse_Categorie_de_presentation
//
//  Created by etudiant on 4/19/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//Intercepter l'evenement levé par la rotation
-(void)viewWillTransitionToSize:(CGSize)size
      withTransitionCoordinator:
(id<UIViewControllerTransitionCoordinator>)coordinator
{
    
    //si on veut savoir quelle est la nouvelle présentation (c'est à dire portrait ou paysage), je dois utiliser le paramétre 'coordinator' comme suit:
    
    //cet coordinateur est le gestionnaire de la transaction
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context)
    {
        //recupéré l'oriontation  finale
        UIInterfaceOrientation orientation =
        [[UIApplication sharedApplication]statusBarOrientation];
        
        if(orientation == UIInterfaceOrientationPortrait)
            NSLog(@"PORTRAIT");
        else
            NSLog(@"PAYSAGE");
    }
        completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context)
    {
        
    }];
    // dans les 2 cas je dois appeler la meme methode de la super classe
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

// Si on veut interdire les rotations et n'autoriser qu'une seule oriontation(par exemple portrait) on ovverride la methode suivant :
//-(UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
   // return UIInterfaceOrientationMaskPortrait;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
