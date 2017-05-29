//
//  Personne.m
//  13_initialisateur
//


#import "Personne.h"

@implementation Personne

//je veux definir un tableau contenant les differents civilites format texte("M","Mme","Melle");
//j'utilise une instructions langage Cpour la definir ce tableau et pour restreindre la portée de ce tableau à ce ficher seulement,
//j'utilise le mot clé du langage C 'static'
static NSArray * tbCivilitesTexte = nil;
//Ce tableau sera initialiser dans le constructeur de la classe.
//(Voir plus bas!);


//Version 1
//Initialisateurs indépendants

/*
-(id)initAvecNom:(NSString *)nom etAvecPrenom:(NSString*)prenom
{
    if(self = [super init])
    {
        self.nom = nom;
        self.prenom = prenom;
    }
    
    return self;
}

-(id)initAvecAnneeNaissance:(int)anneeNaissance
{
    if(self = [super init])
    {
        self.anneeNaissance = anneeNaissance;
        
    }
    
    return self;
}
*/

//initialisateur désigné (designed initializer)
-(id)initAvecCivilite:(int)civilite avecNom:(NSString *)nom
           evecPrenom:(NSString *)prenom etAvecAnneeNaissance:(int)anneNaissance
{
    if(self = [super init])
    {
        @try {
            self.civilite = civilite;
            self.nom = nom;
            self.prenom = prenom;
            self.anneeNaissance = anneNaissance;
        } @catch (NSException *ex) {
            NSLog(@"Exception levée :%@",ex.name);
            NSLog(@"Raison invoquée :%@",ex.reason);
            return nil;
        }
        @finally
        {
            NSLog(@"je passe par le bloque finally");
        }
      
    }
    
    return self;
}

//personnaliser les setters
-(void)setNom:(NSString*)nom
{
    if(![Personne verifierNomOuPrenom:nom])
    {
        //le nom n'est pas conforme
        //je veux empecher la creation de l'objet
        //pour cela je leve une exception
        
        //Version 1
        //NSAssert(false, @"Le nom doit avoir entre 2 et 15 caractére");
        
        //Version 2
        NSException * ex =[NSException
                           exceptionWithName:@"NSException"
                           reason:@"Le nom doit avoir entre 2 et 15 caractére"
                           userInfo:nil];
        //lever l'exception
        @throw ex;
    }
    else
        _nom = nom; //pas de self.nom = nom car cela crée des appels recursifs
}
-(void)setPrenom:(NSString*)prenom
{
    if(![Personne verifierNomOuPrenom:prenom])
    {
        NSAssert(false, @"Le prénom doit avoir entre 2 et 15 caractére");
    }
    else
        _prenom = prenom;
}


+(BOOL)verifierNomOuPrenom:(NSString *)nomOuPrenom
{
    return (nomOuPrenom != nil && nomOuPrenom.length >=2 && nomOuPrenom.length <= 15);
}

//Version 2:
//Initialisateurs de convénience (convenience initializer)- initialisateur
-(id)initAvecNom:(NSString *)nom etAvecPrenom:(NSString*)prenom
{
    NSDate * dateCourante = [NSDate date];
    
    //récupérer un composant de la date
    NSDateComponents * composants =
    [[NSCalendar currentCalendar]components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear
                                   fromDate:dateCourante];
    
    int annee = (int)[composants year];
    int jour = (int)[composants day];
    return [self initAvecCivilite:0 avecNom:nom
                         evecPrenom:prenom etAvecAnneeNaissance:annee];
}

-(id)initAvecAnneeNaissance:(int)anneeNaissance
{
    return [self initAvecCivilite:0 avecNom:@"Inconnu"
                       evecPrenom:@"Inconnu" etAvecAnneeNaissance:anneeNaissance];
}

// Je veux interdire l'utilisation de l'utilisateur sans argument
-(id)init
{
    NSAssert(false, @"Veuillez utiliser initAvecCivilite:avecNom:avecPrenom:etAvecAnneeNaissance:");
    //arguments NSAssert
    //1. expression qui doit retourner un boolean
    //2. message à inserer dans l'exception que NSAssert leve si le 1er argument a la valeur false
    return nil;
}

//constructeur de classe
//(Remarque: cet initialisateur ne sara jamais appelé explicitement)
+(void)initialize
{
    NSLog(@"Initialisateur de la classe");
    
    //cet initialisateur est appelé quand la classe personne est crée mais aussi quand ses sous-classe sont crée aussi
    //(Par exemple une classe Emplayer héritée de Personne)
    //Dans mon cas cet initialisateur de classe doit crée le tableau de civilites
    //Pour empecher le double appel de cet initialisateur par les classe derivée on peut faire le test suivant:
    if([self class] == [Personne class])
        tbCivilitesTexte = @[@"Monsieur",@"Madame",@"Mademoiselle"];
}
-(void)afficherInfos
{
    NSLog(@"%@ %@ %@, né en %d",[tbCivilitesTexte objectAtIndex:self.civilite ],self.prenom,self.nom,self.anneeNaissance);
}
@end
