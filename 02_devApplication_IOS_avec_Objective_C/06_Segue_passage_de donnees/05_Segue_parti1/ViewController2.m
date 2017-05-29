//
//  ViewController2.m
//  05_Segue_parti1
//
//  Created by etudiant on 4/20/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UITextField *txtSaisie;


@end

@implementation ViewController2

//La méthode viewDidLoad n'est appelé qu'une seul fois, lors de la création du controller
//si le controlleur existe dejà et le systeme le réafiche aprés un passage par la pile de des écrans cette methode ne sera pas appelée
- (void)viewDidLoad
{
    [super viewDidLoad];

}
//j'utilise la methode viewWillAppear pour peupler le champ tctSaisie avec l'information transmise à partir du 1er écran
//cette methode est appelé systematiquement juste avent que la vue n'apparaisse à l'écran
-(void)viewWillAppear:(BOOL)animated
{
    self.txtSaisie.text = self.texteRecu;
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
