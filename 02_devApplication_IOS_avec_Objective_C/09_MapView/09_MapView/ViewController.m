//
//  ViewController.m
//  09_MapView
//
//  Created by etudiant on 4/21/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtRecherche;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISlider *sliderRegion;
@property (nonatomic)BOOL suivreUtilisateur;
@property (nonatomic)float coteRegion;
@property (nonatomic)MKCoordinateRegion  region_a_afficher;
@property (nonatomic,strong)CLLocationManager * locationManager;
@property (nonatomic)CLLocationCoordinate2D dernierPosition;
@property (nonatomic)CLLocationCoordinate2D positionPassager;
@property (nonatomic,strong)MKPointAnnotation * annotationPassager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //initialisations
    
    //rendre la map transparente
    
    self.mapView.alpha = 0;
    self.suivreUtilisateur = YES;
    self.coteRegion = self.sliderRegion.value;
    
    //initialiser le type de la map au type standars
    self.mapView.mapType = MKMapTypeStandard;
    //créer le gestionnaire de localisation
    self.locationManager = [[CLLocationManager alloc]init];
    
    //declarer que mon controlleur est le delégué de la mapView
    self.mapView.delegate = self;
    
    //demander l'autorisation de connaitre la position de l'utilisateur
    [self.locationManager requestWhenInUseAuthorization];
    
    //démarrer le gestionnaire de localisation
    [self.locationManager startUpdatingLocation];
    
    //demander à la map d'afficher la position de l'utilisateur
    self.mapView.showsUserLocation = YES;
    
    
    
}
- (IBAction)typeMapChanged:(UISegmentedControl *)sender
{
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
        
        default:
            break;
    }
}
- (IBAction)suitchSuivreChanged:(UISwitch *)sender
{
    self.suivreUtilisateur = [sender isOn];
}

- (IBAction)sliderRegionChanged:(UISlider *)sender
{
    self.coteRegion = sender.value;
    [self afficherMap];
}


-(void)afficherMap
{
    //récuperer la position de l'utilisateur
    //si son suivi a été demandé(boolean suivre est vrai)
    if(self.suivreUtilisateur)
    {
        self.dernierPosition = CLLocationCoordinate2DMake(self.mapView.userLocation.coordinate.latitude, self.mapView.userLocation.coordinate.longitude);
        NSLog(@"Dernier position connue : latitude : %f, longitude : %f",self.dernierPosition.latitude,self.dernierPosition.longitude);
        
        //créer une region dont le coté a été récuperé a partir du slider
        self.region_a_afficher = MKCoordinateRegionMakeWithDistance(
                                                    self.dernierPosition,
                                                    self.coteRegion * 1000,
                                                    self.coteRegion * 1000);
        
        //passer cette région à la map pour l'afficher
       
        [self.mapView setRegion:self.region_a_afficher animated:YES];
        
        
        
        //simmule et afficher la position d'un autre point mobile
        //Pour voir les 2 position en mémé temps, je vais calculer les coordonée du point mobile à partir des coordonée de l'utilisateur
        
        self.positionPassager = CLLocationCoordinate2DMake(self.mapView.userLocation.coordinate.latitude + 0.005, self.mapView.userLocation.coordinate.longitude - 0.003);
        
        //si une annotation a dejà été crée et afficher la supprimer de la map
        if(self.annotationPassager)
            [self.mapView removeAnnotation:self.annotationPassager];
        
        //Crée et afficher une annotation qui précise la position du passager qui attend le taxi
        self.annotationPassager = [[MKPointAnnotation alloc]init];
        [self.annotationPassager setCoordinate:self.positionPassager];
        [self.annotationPassager setTitle:@"Passager"];
        [self.annotationPassager setSubtitle:@"Pierre"];
        [self.mapView addAnnotation:self.annotationPassager];
        
        //rendre la map visible si elle ne pas deja.
        if(self.mapView.alpha == 0)
            self.mapView.alpha  = 1;
    }
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    [self afficherMap];
}
- (IBAction)bntRechercheTouched:(id)sender
{
    NSLog(@"aaa");
    //je veux executer une recherche pour trouver
    //les endroits convenant à la saisie faire dans txtRecherche
    
    //crée une requete de recherche
    MKLocalSearchRequest * requete =
    [[MKLocalSearchRequest alloc]init];
    
    // ... et lui passer la saisie
    requete.naturalLanguageQuery = self.txtRecherche.text;
    
    // ...et la region de recherche aussi
    requete.region = self.region_a_afficher;
    
    //créer un objet de type MKLocalSearch contenant la requete crée plus
    
    MKLocalSearch * recherche = [[MKLocalSearch alloc]initWithRequest:requete];
    
    [recherche startWithCompletionHandler:^(MKLocalSearchResponse * _Nullable response, NSError * _Nullable error)
    {
            if(error)
            {
                NSLog(@"La recherche n'a pas abouti.Raison invoquée : %@",error);
                return;
            }
        //Les items trouvé suite à la recherche sont déposé dans un tableau qui se trouve dans l'argument 'reponse'
        if(response.mapItems.count == 0)
            NSLog(@"Aucun résultat");
        else
        {
            //parcourir le tablea das items trouvés
            for(MKMapItem * item in response.mapItems)
            {
                //créer un MKPointAnnotation pour chaque intem trouvé
                MKPointAnnotation * pointInteret =
                [[MKPointAnnotation alloc]init];
                
                pointInteret.coordinate = item.placemark.coordinate;
                pointInteret.title = item.name;
                pointInteret.title = item.phoneNumber;
                
                //ajouter la nouvelle annotation a la map
                [self.mapView addAnnotation:pointInteret];
            }
        }
    }];
}
- (IBAction)btnRetournClavierTouched:(UITextView *)sender
{
    [sender resignFirstResponder];
    NSLog(@"hhh");
    [self bntRechercheTouched:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
