//
//  ViewController.m
//  05_Segue_parti1
//
//  Created by etudiant on 4/20/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "ViewController3.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtSaisie;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//overrider la methode qui est executée juste avant la transition juste avant le segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //quel est le destinataire de ca segue ?
    //Dans notre cas on peut aller vers l'ecrant2 et 3
    //recuper le controleur de detination
    UIViewController * destination = segue.destinationViewController;
    
    if([destination isMemberOfClass:[ViewController2 class]])
        {
            ViewController2 * dest = (ViewController2 *)destination;
            dest.texteRecu = self.txtSaisie.text;
        }
    else if([destination isMemberOfClass:[ViewController3 class]])
    {
        ViewController3 * dest = (ViewController3 *)destination;
        dest.donneesRecu = self.txtSaisie.text;
    }
}

//cette méthode(crée par nos soins) a été liée à l'évenement 'unwind' qui transfert le controle de l'ecran 3 vers l'ecran de depart de segue(Ecran 1)
-(IBAction)retourAuPremierEcran:(UIStoryboardSegue *)segue
{
    NSLog(@"Execution de la méthode retourAuPremierEcran");
    //recuperer la source de 'unwind'(du chemin de retour)
    ViewController3* ecran3 =
    (ViewController3*)segue.sourceViewController;
    
    //pour recuper les donnees saisie dans l'ecran3
    //je peux
    
    //Solution1:
    //Utiliser une exportée qui contient les donnée saisies
    //self.txtSaisie.text = ecran3.donneesRecu;
    
    //Solution2:
    //Utiliser une methode exportée par l'ecran 3 capable de fournir ces données
    self.txtSaisie.text = [ecran3 recupererDonneesSaisies];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
