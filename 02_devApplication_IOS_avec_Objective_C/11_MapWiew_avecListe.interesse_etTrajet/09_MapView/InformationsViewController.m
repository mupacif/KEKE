//
//  InformationsViewController.m
//  09_MapView
//
//  Created by etudiant on 4/25/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "InformationsViewController.h"

@interface InformationsViewController ()
@property (weak, nonatomic) IBOutlet UITextView *txtInformations;
@end

@implementation InformationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* txt = @"";
    
    //concatener tous les items du tableau et les séparer d'un passage à la ligne
    for (NSString* item in self.tbInformation) {
        txt = [NSString stringWithFormat:@"%@%@\n",txt,item];
    }
    
    self.txtInformations.text = txt;
}

- (IBAction)btnRetourTouch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
