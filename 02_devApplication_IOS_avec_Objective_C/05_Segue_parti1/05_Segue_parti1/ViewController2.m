//
//  ViewController2.m
//  05_Segue_parti1
//
//  Created by etudiant on 4/20/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)btnRetourToucher:(id)sender
{
    //retrouver la page1 en fermant la page2
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 NSLog(@"La page 2 a été fermée");
                             }];
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
