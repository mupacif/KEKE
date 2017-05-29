//
//  ViewController.m
//  03_Pliste(Liste_de_propriete)
//
//  Created by etudiant on 4/19/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *etqNom;

@property (weak, nonatomic) IBOutlet UILabel *etqPrenom;

@property (weak, nonatomic) IBOutlet UILabel *etqDateNaissance;

@property (weak, nonatomic) IBOutlet UITextField *txtNbEnfants;
@property (weak, nonatomic) IBOutlet UITextField *txtSalaire;
@property (weak, nonatomic) IBOutlet UITextField *txtTelephone;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //récupérer le chemain d'accés au ficher donnesPersonnel.plist qui se trouve dans le bundle(l'archive de lapplicatio)
    
    //j'utilise l'enchainement de méthode suivant
    //-je recuper le bundle
    //-je demande au bandle de me faournir le chemain d'accés vers une ressource ayant un certain nom et un certain type
    NSString * nomFicher = [[NSBundle mainBundle]pathForResource:@"DonneesPersonnelles"
                                   ofType:@"plist"];
    NSLog(@"%@",nomFicher);
    
    //charger le contenu du ficher .plist
    //Pour cela j'utilise un initialisateur d'un dictionnaire modifiable
    
    NSMutableDictionary * dicDonnesPersonnelles =
    [[NSMutableDictionary alloc]
     initWithContentsOfFile:nomFicher];
    
    NSLog(@"%@",[dicDonnesPersonnelles debugDescription]);
    
    //initialiser les champs d'affichage avec le contenu récupere et dépose dans dictionnaire
    
    self.etqNom.text = [dicDonnesPersonnelles objectForKey:@"Nom"];
    self.etqPrenom.text = [dicDonnesPersonnelles objectForKey:@"Prenom"];
    self.etqDateNaissance.text = [[dicDonnesPersonnelles objectForKey:@"Date naissance"]description];
    self.txtNbEnfants.text = [[dicDonnesPersonnelles objectForKey:@"Nobre enfants"]description];
    self.txtSalaire.text = [[dicDonnesPersonnelles objectForKey:@"Salaire"] description];
    
    //Remarque : un ficher qui se trouve dans le bunle
    //ne paut pas etre modifier.
    //si on veut modifier des propriété récupérees à partir de ce ficher ou en définir d'autre           esi on veut le sauvegarder il faut créer une autre ficher plist
    //ce ficher doit etre créer dans l'espace dédie à l'application ou dans un de ses sous-repertoires
    //D'habitude on utilse le sous-repertoir documents
    
    //le nouveau ficher appelé Perso.plist est crée plus bas
    //ici je dois recuperer son contenu pour initialiser les champs du formulaire
    
    NSArray * tbpaths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString * nomCompletFicherContenantSaisie = [[tbpaths objectAtIndex:0]stringByAppendingPathComponent:@"Perso.plist"];
    
    NSMutableDictionary * dicDonneesSaisies =
    [[NSMutableDictionary alloc]
     initWithContentsOfFile:nomCompletFicherContenantSaisie];

    //a-t-on chargé le dictionnaire?
    if(dicDonneesSaisies != nil)
    {
        NSNumber * salaire = [dicDonneesSaisies objectForKey:@"Salaire"];
        self.txtSalaire.text = [NSString stringWithFormat:@"%.2f",[salaire doubleValue]];
        NSNumber * nbEnfants = [dicDonneesSaisies objectForKey:@"Nobre enfants"];
        self.txtNbEnfants.text =  [NSString stringWithFormat:@"%d",[nbEnfants intValue]];
        
        self.txtTelephone.text = [dicDonneesSaisies objectForKey:@"Telephone"];
        
    }
    else
        self.txtTelephone.text = @"";
}
- (IBAction)btnSauvegarderTouché:(id)sender
{
    //Récupérer la saisie
    NSString * telephone = self.txtTelephone.text;
    NSString * salairetxt = self.txtSalaire.text;
    NSNumber * salaire;
    if(salairetxt.length > 0) //tester l'existance de la saisie
    {
        salaire = [NSDecimalNumber decimalNumberWithString:salairetxt];
        //NSLog(@"%@",salaire);
        //a-t-on une valeur Nan (Not a Number)?
        //PouR cela je compare le salaire obtenu avec la
        //valeur spéciale Not

        if([salaire isEqualToNumber:[NSDecimalNumber notANumber]])
            {
                [self afficherAlerteAvecTitre:@"Erreur  saisie" etMessage:@"Le salaire n'est pas correct "];
                return;
            }
        //si j'arrive ici,j'ai un salaire numerique mais est-il acceptable?
        //extraire la valeur du salaire de l'objet 'salaire' (qui est du type NSNumber) et la comparer avec une limite supérieure et une limite inférieure
        double sal  = [salaire doubleValue];
        
        if(sal < 0 || sal  > 20000)
        {
            [self afficherAlerteAvecTitre:@"Erreur  saisie" etMessage:@"Le salaire n'est pas correct "];
            return;
        
        }
    }
    
    NSString * nbEnfantsTxt = self.txtNbEnfants.text;
    NSNumber * nbEnfants;
    if(nbEnfantsTxt.length > 0)
            nbEnfants = [NSDecimalNumber decimalNumberWithString:nbEnfantsTxt];
    {
        
        if([nbEnfants isEqualToNumber:[NSDecimalNumber notANumber]])
        {
            [self afficherAlerteAvecTitre:@"Erreur  saisie" etMessage:@"Le nbEnfants n'est pas correct "];
            return;
        }
        int nb = [nbEnfants intValue];
        if(nb < 0 || nb > 12)
        {
            [self afficherAlerteAvecTitre:@"Erreur  saisie" etMessage:@"Le nbEnfants n'est pas correct entre 0 et 12 svp?"];
            
            return;
        }
    }
    
    //créer un dictionnaire modifiable contenant les valeurs de saisie
    NSMutableDictionary * dico =
    [[NSMutableDictionary alloc]init];
    //insérer les valeurs saisies

    [dico setObject: nbEnfants forKey:@"Nobre enfants"];
    [dico setObject: salaire forKey:@"Salaire"];
    [dico setObject: telephone forKey:@"Telephone"];
    
    //je veux sauvegarder ce dictionnaire dans un ficher .plist
    //je ne peux pas le faire dans DonneesPersonnelles.plist
    //car ce ficher appartient au bandle et n'est pas modifiable
    //je dois donc crée un nouveau ficher plist
    //ou?
    //Dans l'espace disque de l'application ou sans un de ses sous-repértoires(comme Documents)
    
    //Récupérer le nom du répertoire ou on deposéra notre ficher
    NSArray * tbpaths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
   // NSLog(@"##%@",[tbpaths description]);
    
    //créer nom du ficher plist
    NSString * nomCompletFicher = [[tbpaths objectAtIndex:0]stringByAppendingPathComponent:@"Perso.plist"];
    
    NSLog(@"###%@",nomCompletFicher);
    //sauvegarde le dictionnaire
    [dico writeToFile:nomCompletFicher atomically:YES];
    
}

-(void)afficherAlerteAvecTitre:(NSString*)titre etMessage:(NSString*)message
            {
                UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"titre"
                    message:message
                    preferredStyle:UIAlertControllerStyleAlert];
                
                //définir un bouton pour fermer l'alerte
                UIAlertAction * actionFermeture = [UIAlertAction actionWithTitle:@"Fermer"
                                                                style:UIAlertActionStyleCancel
                                                                         handler:nil];
                //attacher le bouton a l'alerte
                [alert addAction:actionFermeture];
                
                //afficher l'alerte
                [self presentViewController:alert
                 animated:YES
                 completion:nil];
            }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
