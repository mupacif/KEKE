//
//  ViewController.m
//  14_EchangeServeur
//
//  Created by etudiant on 4/26/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Utils.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtUrl;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //etape 1
    //charger contenu page web en utilisant une session asyncrone (background)
    NSURLSession* session = [NSURLSession sharedSession];
    
    //etape 2
    //preciser l'url
    NSURL* url = [NSURL URLWithString:@"https://openclassrooms.com"];
    //definir une tache a executer par la session
    NSURLSessionDataTask* taches =
    [session dataTaskWithURL:url
           completionHandler:^(NSData*  data,
                               NSURLResponse* response,
                               NSError *  error) {
               if (data == nil) {
                   NSLog(@"aucune donnees charger");
               } else {
                   NSLog(@"Donnée chargées");
                   //NSLog(@"%@",[NSString stringWithUTF8String:[data bytes]]);//byte transformer
                   //NSLog(@"%@",data);//en byte
               }
           }];
    //executer la tache
    [taches resume];
    NSLog(@"Tache lancer");
    [self afficherPageWeb:@"http://www.apple.com"];
    
    //http://192.168.21.100:8080/ServiceRESTavecJSON/monService/test
    
    //etape 3
    //envoyer des information formater en json vers le serveur et recuperer sa reponse json
    //pour pouvoir creer une chaine json, je dois stocker les données dans un dictionnaire
    NSDictionary* dicInfo = @{
                              @"nombre" : @3,
                              @"prefix" : @"Ville"
                              };
    //jsonifier ce dico
    NSString* chaineJson = [Utils objectToJson:dicInfo];
    NSLog(@"%@",chaineJson);
    
    //je veux envoyer la chaine json au serveur
    //pour cela je dois
    //- creer l'url sur l'addresse serveur
    url = [NSURL URLWithString:@"http://192.168.21.100:8080/ServiceRESTavecJSON/monService/test"];
    //- creer une requete
    NSMutableURLRequest* requete = [[NSMutableURLRequest alloc] initWithURL:url];
    //- preciser la methode de requete de transfert
    [requete setHTTPMethod:@"POST"];
    //- injecter les données
    //dans mon cas il ne s'agit que d'une seule chaine a envoyer et je vais l'attacher à une seule clé "json"
    //notre serveur attend la clef "json"
    NSString* queryString = [NSString stringWithFormat:@"json=%@",chaineJson];
    
    //avant d'injecter ce queryString dans la requete, je dois le transformer en nsdata
    NSData* dataQueryString = [queryString dataUsingEncoding:NSUTF8StringEncoding];
    
    //injecter ces donnes dans le corps de la requete
    [requete setHTTPBody:dataQueryString];
    
    //creer la session de chargement de contenu async
    session = [NSURLSession sharedSession];
    taches = [session dataTaskWithRequest:requete
                        completionHandler:^(NSData* data,
                                            NSURLResponse* response,
                                            NSError* error) {
                            if (error != nil) {
                                NSLog(@"Erreur: %@",error);
                                return ;
                            }
                            if (data == nil) {
                                NSLog(@"Aucune données charger");
                                return;
                            }
                            //debug
                            NSLog(@"%@",[NSString stringWithUTF8String:[data bytes]]);
                        }];
    [taches resume];
    
}

- (IBAction)btnChargerTouch:(id)sender {
    [self afficherPageWeb:self.txtUrl.text];
}

-(void)afficherPageWeb:(NSString*)urlText{
    //plus haut j'ai utiliser la methode URLWithString
    //mais on peut creer aussi avec son constructeur
    NSURL* url = [[NSURL alloc] initWithString:urlText];
    
    //pour afficher la page, il faut d'abors la charger
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    //envoyer la requete vers le serveur et charger sa reponse dans la web view
    [self.webView loadRequest:request];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
