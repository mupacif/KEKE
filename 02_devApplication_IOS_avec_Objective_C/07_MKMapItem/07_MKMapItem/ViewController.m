//
//  ViewController.m
//  07_MKMapItem
//
//  Created by etudiant on 4/20/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <Contacts/Contacts.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtAdresse;
@property (weak, nonatomic) IBOutlet UITextField *txtVille;
@property (weak, nonatomic) IBOutlet UITextField *txtCP;
@property (weak, nonatomic) IBOutlet UITextField *txtPays;

@property(nonatomic) CLLocationCoordinate2D coordonnesDestination;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btnAfficherTrajetTouched:(id)sender
{
    
    //recuper une instance du service de geolocalisation
    CLGeocoder * geocoder = [[CLGeocoder alloc]init];
    
    //crée une chaine contenant l'adresse de destination
    NSString * adresse = [NSString stringWithFormat:@"%@ %@ %@ %@",self.txtAdresse.text,self.txtVille.text,self.txtCP.text,self.txtPays.text];
    NSLog(@"%@",adresse);
    
    //Passer l'adresse obtenue à partir de la saisie au service de géolocalisation
    [geocoder geocodeAddressString:adresse
                completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error)
                {
                    //analyser l'argument arror pour savoir si l'adresse saisie a été trouvée
                    if(error)
                    {
                        NSLog(@"Echec de service geocode avec erreur %@",error);
                        return;
                    }
                    //si geocoder a trouver une adresse au plusieurs
                    //qui corresponde à la saisie données,il les met dans un tableau qui nous est forni dans l'argument placemarks
                    //si aucune adresse n'a été trouvé placemarks contient 'nil'
                    if(placemarks || placemarks.count > 0)
                    {
                        //choisir la prémier adresse trouvée
                       CLPlacemark * placemark = placemarks[0];
                        //récupere les coordonnée géographique de cette adresse
                       float latitude = placemark.location.coordinate.latitude;
                        float longitude = placemark.location.coordinate.longitude;
                        NSLog(@"latitude: %f, longutude: %f",latitude,longitude);
                        
                        self.coordonnesDestination = placemark.location.coordinate;
                        
                        [self afficherMap];
                        
                    }
                }];
}
-(void)afficherMap
{
    //créer un dictionnaire qui doit contenir les informations saisie c'est à dire les information du point d'arrivée de notre trajet
    //Ce dictionnaire possede des cles specifique
    NSDictionary * dicoDestination = @{
                        CNPostalAddressCityKey:self.txtVille.text,
                        CNPostalAddressStreetKey:self.txtAdresse.text,
                        CNPostalAddressPostalCodeKey:self.txtCP.text,
                        CNPostalAddressCountryKey:self.txtPays.text
                                       };
    MKPlacemark * placemarkDestination = [[MKPlacemark alloc]initWithCoordinate:self.coordonnesDestination addressDictionary:dicoDestination];
    MKMapItem * mkMapItem = [[MKMapItem alloc]initWithPlacemark:placemarkDestination];
    
    //preciser des eventuelles options de parcours ces options doivent etre données aussi dans un dictionnaire avec des cles specifique
    NSDictionary * dicoOptions = @{
                                MKLaunchOptionsDirectionsModeKey :
                                MKLaunchOptionsDirectionsModeDriving
                                   };
    [mkMapItem openInMapsWithLaunchOptions:dicoOptions];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
