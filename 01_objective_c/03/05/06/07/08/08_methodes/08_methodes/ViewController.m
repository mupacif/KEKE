//
//  ViewController.m
//  08_methodes
//


#import "ViewController.h"

@interface ViewController () //extension

//Definir 2 propriété privé
@property (nonatomic)double soldeCompteBancaire;
@property (nonatomic)double prixProduit;
@property (weak, nonatomic) IBOutlet UIImageView *monImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.soldeCompteBancaire = 450.25;
    self.prixProduit = 420;
    NSLog(@"%@",[self peutOnAcheterProduitAyantPrix:self.prixProduit]
          ? @"Oui": @"Non");
    NSLog(@"%@",[self peutOnAcheterProduitAyantPrix:self.prixProduit etTauxTVA:0.21]
          ? @"Oui": @"Non");
    NSLog(@"%@",[self peutOnAcheterProduitAyantPrix:self.prixProduit :0.21]
          ? @"Oui": @"Non");
    
    [self chargerImage];
}

-(BOOL) peutOnAcheterProduitAyantPrix:(double)prix_a_payer
{
    /*
    if(self.soldeCompteBancaire >= prix_a_payer)
        return YES;
    return No;
     */
    return self.soldeCompteBancaire >= prix_a_payer;
}
-(BOOL) peutOnAcheterProduitAyantPrix:(double)prix_a_payer etTauxTVA:(double)pourcentage
{
    
return self.soldeCompteBancaire >= (1 + pourcentage) * prix_a_payer;
    //le nom de la fonction est:
    // peutOnAcheterProduitAyantPrix:etTauxTVA:
    
}

//Objective-C permet de ne pas préciser les noms externe des arguments
//(Mais l'usage de la fonction est plus confus)

-(BOOL) peutOnAcheterProduitAyantPrix:(double)prix_a_payer :(double)pourcentage
{
    
    return self.soldeCompteBancaire >= (1 + pourcentage) * prix_a_payer;
    //le nom de la fonction est:
    // peutOnAcheterProduitAyantPrix:etTauxTVA:
    
}


-(void) chargerImage
{
    NSString * chaineUrl = @"http://lorempixel.com/400/200/";
    
    //crée une instance de type NSURL sur l'adresse texte
    NSURL * url = [NSURL URLWithString:chaineUrl];
    //chargée les données de l'image qui se trouve à l'url donnée
    NSData * donnesChargees = [NSData dataWithContentsOfURL:url];
    //transformer les données chargées en image
    UIImage * imageChargée = [UIImage imageWithData:donnesChargees];
    //donner cette image à l'objet UIImageView repréesentée par la propriété monImage
    self.monImage.image = imageChargée;
    
}

//Exercice 4

- (IBAction)btnChargePhoto:(id)sender {
    [self chargerImage];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
