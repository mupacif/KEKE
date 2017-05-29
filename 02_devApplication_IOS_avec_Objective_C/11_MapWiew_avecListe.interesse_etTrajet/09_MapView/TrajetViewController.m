//
//  TrajetViewController.m
//  09_MapView
//
//  Created by etudiant on 4/24/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "TrajetViewController.h"
#import <MapKit/MapKit.h>
#import "Utils.h"
#import "InformationsViewController.h"

@interface TrajetViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *maMap;
@property (strong,nonatomic) NSMutableArray* tbInformations;
@end

@implementation TrajetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //rendre la map transparente
    self.maMap.alpha = 0;
    
    //demander explicitement l'affichage de la position de l'utilisateur (car par defaut, la map ne l'affiche pas)
    self.maMap.showsUserLocation = YES;
    
    //declarer que ce controleur est le deleguer de la map (qu'il implemente certaines methode du protocole MKMapViewDelegate)
    self.maMap.delegate = self;
}

//implementer la methode du protocole MKMapViewDelegate qui est appeler quand la position de l'utilisateur change
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    //est-ce la premiere fois que la postion de l'utilisateur à été récupérer ?
    if (self.maMap.alpha == 0) {
        //definir un zoom initial à l'aide d'une région(disons 2000m x 2000m) centrée sur la position de l'utilisateur passée en paramètres
        MKCoordinateRegion region =
        MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake
                                           (userLocation.coordinate.latitude,
                                            userLocation.coordinate.longitude),
                                           2000, 2000);
        
        //passze cette region à la map
        self.maMap.region = region;
        
        //rendre opaque
        self.maMap.alpha = 1;
        
        [self calculerTrajet];
        
    } else {
        self.maMap.centerCoordinate = userLocation.coordinate;
    }
}

- (IBAction)btnRetourEcranPrecedentTouch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnRetourPremierEcranTouch:(id)sender {
    
}

- (IBAction)btnRefreshTouch:(id)sender {
    [self calculerTrajet];
}

-(void)calculerTrajet {
    //supprimer tout les trajets existants
    [self supprimerToutLesTrajets];
    
    //creer une demande de calcul de trajet
    MKDirectionsRequest* demandeTrajet = [[MKDirectionsRequest alloc] init];
    
    //définir le point de départ
    //dans mon cas le point de départ est la position de l'utilisateur
    demandeTrajet.source = [MKMapItem mapItemForCurrentLocation];
    
    //definir le point d'arriver
    demandeTrajet.destination = self.destinationTrajet;
    
    //afficher les routes alternatives
    demandeTrajet.requestsAlternateRoutes = NO;
    
    //créer et intégrer dans la demande un objet qui contiendra les informations sur le trajet
    //et lui attacher la demande
    MKDirections* direction = [[MKDirections alloc] initWithRequest:demandeTrajet];
    
    //executer la requete (envoyer la demande)
    [direction calculateDirectionsWithCompletionHandler:
     ^(MKDirectionsResponse*  response, NSError*  error) {
         if (error) {
             [Utils afficherAlerteAvecTitre:@"Calcul trajet"
                                  etMessage:[NSString stringWithFormat:@"Le calcul du trajet à échouer. Raison:%@",
                                             error]
                                   etParent:self];
         } else {
             [self afficherTrajet: response];
         }
     }];
}

-(void)afficherTrajet:(MKDirectionsResponse*)trajet{
    self.tbInformations = [[NSMutableArray alloc] init];
    int nb = 1;
    
    for (MKRoute* route in trajet.routes) {
        //une route est un ensemble de segment (polyline)
        //ces segments doivent etre placer à la map
        [self.maMap addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
        //dessiner le trajet entre la rue et l'etiquette contenant le nom de la rue
        
        for (MKRouteStep* etape in route.steps) {
            [self.tbInformations addObject:[NSString stringWithFormat:@"%i. %@",nb++,etape.instructions]];
        }
        
        NSLog(@"%@",[self.tbInformations debugDescription]);
        //remarque: les instructions obtenus sont en anglais
        //pour tenir compte de la local du telephone et donc afficher des informations en fr
        //je dois :
        // - modifier le fichier de configuration de l'application (cad info.plist)
        //En clair il faut ajouter la propriété Localizations et y ajouter une nouvelle localisation dont l'application doit tenir compte (fr)
        // - configurer la locale du phone
        // setting -> general -> language & region -> other language -> cocher french -> change to french
    }
}

//on utilise la methode suivante définie par le protocole MKMapViewDelegate pour retourner l'objet qui sera utilisé par le systeme pour afficher (pour dessiner) le trajet
-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    //creer le rendeur graphique pour la couche (overlay) passée en parametre
    MKPolylineRenderer* renduGraphique = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    
    //configurer la couleur
    renduGraphique.strokeColor = [UIColor redColor];
    renduGraphique.lineWidth = 5.0;
    
    
    return renduGraphique;
}

-(void)supprimerToutLesTrajets{
    for (id<MKOverlay> couche in self.maMap.overlays) {
        //tester si la couche courante est celle qui affiche les trajets (les polylines) et la supprimer
        if ([couche isKindOfClass:[MKPolyline class]]) {
            [self.maMap removeOverlay:couche];
        }
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    InformationsViewController* destination = (InformationsViewController*)segue.destinationViewController;
    destination.tbInformation = self.tbInformations;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
