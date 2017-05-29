//
//  ViewController.m
//  04_firstResponder
//
//  Created by etudiant on 4/19/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txt1;

@property (weak, nonatomic) IBOutlet UITextField *txt2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)btnCacherClavierTxt1:(id)sender
{
    [self.txt1 resignFirstResponder];
}

- (IBAction)btnCacherClavierTxt2:(id)sender
{
    [self.txt2 resignFirstResponder];
}
- (IBAction)btnFocusSutTxt:(id)sender
{
    [self.txt2 becomeFirstResponder];
}

//donner la possibilité a l'utilisateur àde faire diparaitre le clavier visuel en touchant la partie libre de l'écran

//Pour cela je dois overrider la méthode touch
//touchesBegan et arreter l'edition en cours(ou qu'elle soit)
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES ];
}
//Methode de traitement de l'evenement 'did end on exit'
//qui est leve quand on touch
- (IBAction)btnRoutouClavierToched:(UITextView *)controle
{
    [controle resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
