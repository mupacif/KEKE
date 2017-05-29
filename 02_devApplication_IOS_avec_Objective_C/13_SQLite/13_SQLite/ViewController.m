//
//  ViewController.m
//  13_SQLite
//
//  Created by etudiant on 4/25/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *txtAffichage;
//proprieter qui contiendra le repertoir document de l'application
@property (strong, nonatomic) NSString* refDocument;
//le nom du fichier contenant la base de donnée
@property (strong, nonatomic) NSString* fichierDb;
@property (weak, nonatomic) IBOutlet UIButton *btnLireEmpsApple;
@end

@implementation ViewController
//declarer une variable de type language C qui represntera la base de donnee ayu niveau de mon application
sqlite3* db;
//definir constante type language C qui contiendra le nom du fichier de la base
const char* fichierDb_chaineC;

- (void)viewDidLoad {
    [super viewDidLoad];
    //creer une bordure pour le textView
    self.txtAffichage.layer.borderWidth = 5.0;
    self.txtAffichage.layer.borderColor = [[UIColor blueColor] CGColor];
    
    //recuperer le nom complet du repertoire document
    NSArray* chemin =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,//je precise se que je recherche (en l'occurence le repertoire document)
                                        NSUserDomainMask,
                                        YES);
    
    NSLog(@"%@", chemin[0]);
    
    self.refDocument = chemin[0];
    
    //creer le nom du fichier contenant la base de données
    self.fichierDb = [self.refDocument stringByAppendingPathComponent:@"maDb.sqlite"];
    
    NSLog(@"%@", self.fichierDb);
    
    //recuperer le nom de la base en temps que chaine C
    fichierDb_chaineC = [self.fichierDb UTF8String];
    
    NSLog(@"%s", fichierDb_chaineC);
}

- (IBAction)btnCreerBaseTouch:(id)sender {
    //je dois verifier si le fichier contenant la base existe deja
    //si c'est le cas je dois d'abord le supprimer
    
    //pour verifier si le fichier existe j'ai besoin d'un gestionnaire de fichier (file manager)
    NSFileManager* fm = [NSFileManager defaultManager];
    
    //tester si le fichier maBase.db existe
    if ([fm fileExistsAtPath:self.fichierDb]) {
        //supprimer l'ancienne base
        [fm removeItemAtPath:self.fichierDb
                       error:nil];
    }
    
    fichierDb_chaineC = [self.fichierDb UTF8String];
    
        //creer/ouvrir la base
        int ret = sqlite3_open(fichierDb_chaineC, &db);
        //la fonction sqlite3_open() ouvre la base si elle existe et la crée si se n'est pas le cas
    
        //tester si la base a été créer ou ouverte
        if (ret != SQLITE_OK) {
            [self ajouterTextAffichage:@"Echec creation db"];
            return;
        }
    
        [self ajouterTextAffichage:@"La création de la db à reussi"];
        
        char* msgErreur;
        
        ret = sqlite3_exec(db, "create table if not exists Societes"
                           "("
                           "iDSociete integer primary key autoincrement,"
                           "Societe text not null unique"
                           ")",
                           NULL,
                           NULL,
                           &msgErreur);
        
        if (ret != SQLITE_OK) {
            [self ajouterTextAffichage:[NSString stringWithFormat:@"Echec creation table Societe: %s", msgErreur]];
            sqlite3_close(db);
            return;
        }
        
        [self ajouterTextAffichage:@"La création de la table Societe à reussi"];
        
        ret = sqlite3_exec(db, "create table if not exists Employes"
                           "("
                           "iDEmploye integer primary key autoincrement,"
                           "Nom text not null,"
                           "Prenom text not null,"
                           "DateEmbauche date not null,"
                           "Salaire float not null check(Salaire > 0),"
                           "IdSociete integer not null,"
                           "constraint NomPrenomUnique unique (Nom, Prenom),"
                           "foreign key (iDSociete) references Societes(IdSociete) on delete cascade"
                           ")",
                           NULL,
                           NULL,
                           &msgErreur);
        
        if (ret != SQLITE_OK) {
            [self ajouterTextAffichage:[NSString stringWithFormat:@"Echec creation table Societe: %s", msgErreur]];
            sqlite3_close(db);
            return;
        }
        
        [self ajouterTextAffichage:@"La création de la table Societe à reussi"];
        sqlite3_close(db);
    
}

-(void)ajouterTextAffichage:(NSString*)textAjouter{
    self.txtAffichage.text = [self.txtAffichage.text stringByAppendingFormat:@"%@\n",textAjouter];
}

- (IBAction)btnEcrireDansBaseTouch:(id)sender {
    //recuperer le nom de la base en temps que chaine C
    fichierDb_chaineC = [self.fichierDb UTF8String];
    
    //creer/ouvrir la base
    int ret = sqlite3_open(fichierDb_chaineC, &db);
    //la fonction sqlite3_open() ouvre la base si elle existe et la crée si se n'est pas le cas
    
    //tester si la base a été créer ou ouverte
    if (ret != SQLITE_OK) {
        [self ajouterTextAffichage:@"Echec creation db"];
        return;
    }
    
    //creer la requete d'insertion
    NSString* sql = [NSString stringWithFormat:
                     @"insert into Societes (Societe) "
                     "select 'Apple' "
                     "union "
                     "select 'Oracle' "
                     "union "
                     "select 'Microsoft'"];
    [self ajouterTextAffichage:@"Requete insertion:\n"];
    [self ajouterTextAffichage:sql];
    
    //creer une variable qui contiendra un statement (une enveloppe de mon ordre sql)
    sqlite3_stmt* stmt;
    
    //preparer le statement
    ret = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, nil);
    
    //tester si le statement est okay
    if (ret != SQLITE_OK) {
        [self ajouterTextAffichage:@"Echec préparation statement\n"];
        sqlite3_close(db);
        return;
    }
    //Executer le statement
    ret = sqlite3_step(stmt);
    
    if (ret != SQLITE_DONE) {
        [self ajouterTextAffichage:@"Echec insertion\nErreur signalée:\n"];
        [self ajouterTextAffichage:[NSString stringWithCString:sqlite3_errmsg(db)
                                                      encoding:NSUTF8StringEncoding]];
    } else {
        [self ajouterTextAffichage:@"Insertion réussie\n"];
    }
    
    //je supprime le statement (pour libere ses ressources)
    sqlite3_finalize(stmt);

    sql = [NSString stringWithFormat:
           @"insert into Employes (Nom,Prenom,DateEmbauche,Salaire,idSociete) "
           "select 'Jobs', 'Steve', '2008-04-26', 1250, 1 "//où 1 est l'id d'Apple
           "union "
           "select 'Martin', 'Julie', '%@', 2000, "//sortie d'un argument avec %@
           "(select idSociete from Societes where Societe='Apple') "
           "union "
           "select 'Durant', 'Pierre', '1998-11-22', 3123, 3",[[NSDate date] description]];
    
    [self ajouterTextAffichage:@"Requete d'insertion employés:\n"];
    [self ajouterTextAffichage:sql];
    
    //preparer le statement
    ret = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, nil);
    
    //tester si le statement est okay
    if (ret != SQLITE_OK) {
        [self ajouterTextAffichage:@"Echec préparation statement\n"];
        sqlite3_close(db);
        return;
    }
    //Executer le statement
    ret = sqlite3_step(stmt);
    
    if (ret != SQLITE_DONE) {
        [self ajouterTextAffichage:@"Echec insertion\nErreur signalée:\n"];
        [self ajouterTextAffichage:[NSString stringWithCString:sqlite3_errmsg(db)
                                                      encoding:NSUTF8StringEncoding]];
    } else {
        [self ajouterTextAffichage:@"Insertion réussie\n"];
    }
    
    //je supprime le statement (pour libere ses ressources)
    sqlite3_finalize(stmt);
    sqlite3_close(db);

}

- (IBAction)btnLireTouch:(id)sender {
    //recuperer le nom de la base en temps que chaine C
    fichierDb_chaineC = [self.fichierDb UTF8String];
    
    //creer/ouvrir la base
    int ret = sqlite3_open(fichierDb_chaineC, &db);
    //la fonction sqlite3_open() ouvre la base si elle existe et la crée si se n'est pas le cas
    
    //tester si la base a été créer ou ouverte
    if (ret != SQLITE_OK) {
        [self ajouterTextAffichage:@"Echec creation db"];
        return;
    }
    
    NSString* sql;
    
    if (sender == self.btnLireEmpsApple) {
        sql = @"select IdEmploye, Prenom, Nom, DateEmbauche, Salaire, Societe "
        "from Employes, Societes "
        "where Employes.IDSociete = Societes.IdSociete "
        "and Societe = 'Apple'";
    } else {
        sql = @"select IdEmploye, Prenom, Nom, DateEmbauche, Salaire, Societe "
        "from Employes, Societes "
        "where Employes.IDSociete = Societes.IdSociete";
    }
    
    [self ajouterTextAffichage:@"Requete de lecture\n"];
    [self ajouterTextAffichage:sql];
    
    sqlite3_stmt* stmt;
    
    //preparer le statement
    ret = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, nil);
    
    //tester si le statement est okay
    if (ret != SQLITE_OK) {
        [self ajouterTextAffichage:@"Echec préparation statement\n"];
        sqlite3_close(db);
        return;
    }
    
    //recuperer le nombre de colonnes selectionnes
    int nbColonnes = sqlite3_column_count(stmt);
    NSString* ligne = @"";
    while (sqlite3_step(stmt) == SQLITE_ROW) { //ici la méthode sqlite3_step est equivalent de rs.next() -rs étant un objet de classe ResultSet en Java
        const char* chaineC;
        for (int i = 0; i < nbColonnes; i++) {
            chaineC = sqlite3_column_text(stmt, i);
            
            //créer une chaine obj=c
            NSString* valeur = [[NSString alloc] initWithUTF8String:chaineC];
            
            if (i == 0) {
                ligne = [NSString stringWithFormat:@"%@%@\n",ligne,valeur];
            }else {
                ligne = [NSString stringWithFormat:@"%@,%@\n",ligne,valeur];
            }
        }
        [self ajouterTextAffichage:ligne];
    }
    sqlite3_finalize(stmt);
    sqlite3_close(db);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
