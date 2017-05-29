//
//  ViewController3.m
//  05_Segue_parti1
//
//  Created by etudiant on 4/20/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@property (weak, nonatomic) IBOutlet UITextField *txtSaisie;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    self.txtSaisie.text = self.donneesRecu;
}
- (IBAction)btnRetourTached:(id)sender
{
    self.donneesRecu = self.txtSaisie.text;
}

-(NSString *)recupererDonneesSaisies
{
    return self.txtSaisie.text;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
