//
//  ViewController.m
//  10_UITableVieux_CellulePerso_MasterDetail
//
//  Created by etudiant on 4/21/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Gateau.h"
#import "MaCelluleTableViewCell.h"
#import "DetailViewController.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *maTable;



@property (nonatomic,strong)NSMutableArray * tbGateaux;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.tbGateaux =
  @[
    [[Gateau alloc]initNom:@"Gateau au chocolat"
                  nomImage:@"gateauChocolat.jpg"
               description:@"Le gateau le plus delicieu qui puisse exister"],
    [[Gateau alloc]initNom:@"Meringue"
                  nomImage:@"meringue.jpg"
               description:@"Meringue is a type of dessert, often associated with French, Swiss, and Italian cuisine, made from whipped egg whites (or aquafaba) and sugar,"],
    [[Gateau alloc]initNom:@"Tarte aux peches"
                  nomImage:@"tartePeches.jpg"
               description:@"Tarte familiale aux peches et vanille"],
    [[Gateau alloc]initNom:@"Tiramisu"
                  nomImage:@"tiramisu.jpg"
               description:@"La nature même de la recette - notamment grâce aux nombreux ingrédients et la superposition de couches distinctes - permet de nombreuses variantes de ce dessert, les plus simples consistant à varier le liquide dans lequel on immerge les biscuits (l'alcool ou le café) ou la texture (plus ou moins sèche, plus ou moins crémeuse, etc.)"]
    
   ].mutableCopy;
    
    //Les methode utilisées pour peupler la table se trouvent ici
    //dans la classe ViewController
    //Effectivement dans ViewController.h nous avons déclarer
    //que cette classe est conforme au protocole
    //UITableViewDataSource
    //donc la classe ViewController a été transformée en délegué
    //de la table
    //je précise ceci dans le code
    self.maTable.dataSource = self;
    
}
//overrider la methode du protocol UITableViewDataSource qui retourne le nombre de section de ma table
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}
//methode qui doit retourner le nombre de ligne de la section passé en paramétre
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.tbGateaux.count;
}
//méthode qui doit :
//se procurer une cellule
//-la remplir
//Remarque : la section et la ligne de la cellule sont passée dans l'argument indexPath
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    //récupére une cellule si possible sinon la créer
    MaCelluleTableViewCell * cellule = [self.maTable dequeueReusableCellWithIdentifier:@"maCellulePersonnalisee"];
    if(cellule == nil)//aucune cellule réutilisable n'a été trouvée
    {
        cellule = [[MaCelluleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"maCellulePersonnalisee"];
    }
    //remplire la cellule obtenue
    
    //j'utilise la position de la cellule (la ligne ou elle se trouve) pour recuperer à partir du tableau de gateaux le gateau correspondant à cette ligne 
   Gateau * gateau =  self.tbGateaux[indexPath.row];
    cellule.imgGateau.image = [UIImage imageNamed: gateau.nomImage];
    cellule.etqTitre.text = gateau.nom;
    cellule.etqDescription.text = gateau.texte;
    
    
    return cellule;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //récupérer l'index de la ligne qui a été touché
    //selection
    //on commence par récupérér l'indexPath
    NSIndexPath * indexPath = [self.maTable indexPathForSelectedRow];
    NSInteger  idxLigneSelectionnee = [indexPath row];
    
    Gateau * gateau = self.tbGateaux[idxLigneSelectionnee];
    //récuperer le gateau qui se trouve é cet index
    
    
    //je dois fournir ce gateau au 2em controler
    //(au controler de detail)
    //je récupere le controler de détail à partir du ségue
    //(car ce controleur est la destination de la transition)
    
   DetailViewController * destination = (DetailViewController *)[segue destinationViewController];
    
    destination.gateau = gateau;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
