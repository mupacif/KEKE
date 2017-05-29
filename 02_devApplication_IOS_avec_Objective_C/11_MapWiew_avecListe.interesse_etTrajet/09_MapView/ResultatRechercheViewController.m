//
//  ResultatRechercheViewController.m
//  09_MapView
//
//  Created by etudiant on 4/24/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ResultatRechercheViewController.h"
#import "CellulePersonnaliser.h"
#import "TrajetViewController.h"

@interface ResultatRechercheViewController ()
@property (weak, nonatomic) IBOutlet UITableView *maTable;

@end

@implementation ResultatRechercheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //declarer que ce controleur fournira les methodes de remplissage de la table
    self.maTable.dataSource = self;
}
- (IBAction)btnRetourTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//les methode du protocole UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemTrouves.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //recuperer une cellule ayant l'identifiant du type "cellulesPersonnaliser"
    //et dont la position qui lui sera attribuer dans la liste est préciser par l'argument indexPath
    CellulePersonnaliser* cellule =
    [self.maTable dequeueReusableCellWithIdentifier:@"celluleResultat"
                                       forIndexPath:indexPath];
    
    //peupler la cellule
    // recuperer l'objet se trouvant à l'index de la courante dans itemsTrouves
    MKMapItem* item = self.itemTrouves[indexPath.row];
    cellule.etqNom.text = item.name;
    
    cellule.etqTelephone.text = item.phoneNumber;
    return cellule;
}

- (IBAction)troisiemeEcranVersPremierEcran:(UIStoryboardSegue*)segue{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //recuperer la destination de la transition (du segue)
    TrajetViewController* destination =
    (TrajetViewController*)[segue destinationViewController];
    
    //chercher l'index de la ligne selectionner dans la table
    NSIndexPath* indexPath = [self.maTable indexPathForSelectedRow];
    NSInteger indexLigne = indexPath.row;
    
    destination.destinationTrajet = self.itemTrouves[indexLigne];
}

@end
