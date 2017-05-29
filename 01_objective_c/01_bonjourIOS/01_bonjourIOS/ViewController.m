//
//  ViewController.m
//  01_bonjourIOS
//
//  Created by etudiant on 4/11/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)btnClickMoiTouch:(UIButton *)sender
{
    NSLog(@"Vous avais cliqué");
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"BONJOUR"
        message:@"Bienvenue dans le monde objective C"
        preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * actionFermeture = [UIAlertAction
                                       actionWithTitle:@"Fermer cette alerte"
                                       style:UIAlertActionStyleCancel
                                       handler:nil];
    [alert addAction: actionFermeture];
    [self presentViewController:alert animated:NO completion:nil];
    
}


- (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }


@end
