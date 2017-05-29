//
//  DetailViewController.m
//  10_UITableVieux_CellulePerso_MasterDetail
//
//  Created by etudiant on 4/24/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgGateau;
@property (weak, nonatomic) IBOutlet UILabel *etqTitre;

@property (weak, nonatomic) IBOutlet UILabel *etqDescription;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.etqTitre.text = self.gateau.nom;
    self.etqDescription.text = self.gateau.texte;
    self.imgGateau.image = [UIImage imageNamed:self.gateau.nomImage];
    
}

- (IBAction)btnRetourTached:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
