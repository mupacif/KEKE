//
//  ViewController.m
//  08_locationManager
//
//  Created by etudiant on 4/20/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *etqLatitude;
@property (weak, nonatomic) IBOutlet UILabel *etqLongitude;
@property (weak, nonatomic) IBOutlet UILabel *etqAltitude;
@property (weak, nonatomic) IBOutlet UILabel *etqPecisionH;
@property (weak, nonatomic) IBOutlet UILabel *etqPecisionV;
@property (weak, nonatomic) IBOutlet UILabel *etqAdresse;
@property (weak, nonatomic) IBOutlet UILabel *etqDistance;

@property (nonatomic,strong)CLLocationManager * locationManager;
@property (nonatomic)CLLocationDistance  distance;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [CLLocationManager new];
    
    //recupere et afficher le niveau de precision souhaité
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    //je veux overrider quelque methode des CLLocationManager
    //pour leur donner le code dont j'ai besoin.
    //Ainsi faisont ma classe VieuwController devienun délégué
    //quelqun qui exécute certaines tache par procuration
    
    // pour obtenir cette qualité de 'delegue' de CLLocationManager
    //pour notre classe ViewControlle je dois:
    //-déclarer que ma classe est conforme au protocole qui contient les méthode en question
    //-déclarer que ma classe est le délégué de l'objet locationManager:
    
    
    self.locationManager.delegate = self;
    
    //demander à l'utilisateur la permission de connaitre sa position
    [self.locationManager requestWhenInUseAuthorization];
    
    //demarrer l'activité du gestionnaire de positions
    [self.locationManager startUpdatingLocation];
    

    }
//implementer la methode du protocole CLLocationManagerDelegate
//qui  est appelé lorsue la position de l'utilisateur a changé
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    
    //recupere et afficher la latitude
    NSString * latitude = [[NSString alloc]initWithFormat:@"%.6f",newLocation.coordinate.latitude];
    self.etqLatitude.text = latitude;
    //recupere et afficher la longitude
    NSString * longitude = [[NSString alloc]initWithFormat:@"%.6f",newLocation.coordinate.longitude];
    self.etqLongitude.text = longitude;
    //recupere et afficher altitude
    NSString * altitude = [[NSString alloc]initWithFormat:@"%.6f",newLocation.altitude];
    self.etqAltitude.text = altitude;
    //recupere et afficher precisionH
    NSString * precisionH = [[NSString alloc]initWithFormat:@"%.6f",newLocation.horizontalAccuracy];
    self.etqPecisionH.text = precisionH;
    //recupere et afficher precisionV
    NSString * precisionV = [[NSString alloc]initWithFormat:@"%.6f",newLocation.verticalAccuracy];
    self.etqPecisionV.text = precisionV;
   
    //ajouter à la distance dejà parcurue le dernier segment
    self.distance +=
    [newLocation distanceFromLocation:oldLocation];
    
    if(self.distance < 0)
    {
        self.etqDistance.text = @"0";
    }
    else
    {
    NSString * distanceTxt = [[NSString alloc]initWithFormat:@"%.0f",self.distance];
    self.etqDistance.text = distanceTxt;
    }
    // recupere si possible une adresse à partire de la position newLocation
    CLGeocoder * geocoder =[CLGeocoder new];
    [geocoder reverseGeocodeLocation:newLocation
                   completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                       if(error)
                       {
                           NSLog(@"Geolocoder à echoué avec l'erreur %@",error);
                           return;
                       }
                       if(placemarks && placemarks.count > 0)
                       {
                           
                           CLPlacemark * placemark = placemarks[0];
                           
                           //Cet objet contient aussi bien les coordonées géographique que l'adresse(nr,rue,ville,pays)
                           //recupéré ces informations à l'aide de dictionnaire
                           NSDictionary * dicoAvecAdresse = [placemark addressDictionary];
                           
                           //Afficher le dico avec debugDescr
                           //pour trouver les clés
                           //NSLog(@"%@",[dicoAvecAdresse debugDescription]);
                           //La sortie nous affiche un certain nombre de clés
                           //j'en retients les suivantes:
                           //Street,City,Zip,Country
                           //recupéré a partire de ce dictionnaire les composants de l'adresse
                           NSString * adresse =  [dicoAvecAdresse objectForKey:@"Street"];
                           NSString * ville =  [dicoAvecAdresse objectForKey:@"City" ];
                           NSString * cp =  [dicoAvecAdresse objectForKey:@"ZIP" ];
                           NSString * pays =  [dicoAvecAdresse objectForKey:@"Country"];
                           
                           self.etqAdresse.text = [NSString stringWithFormat:@"%@, %@ %@, %@",adresse,cp,ville,pays];
                       }
                       else
                           self.etqAdresse.text = @"";
                   }];
    
}



- (IBAction)btnRemiseazeroTouched:(id)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
