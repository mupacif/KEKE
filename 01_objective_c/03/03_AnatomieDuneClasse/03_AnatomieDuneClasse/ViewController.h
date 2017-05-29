//
//  ViewController.h
//  03_AnatomieDuneClasse
//
/* Le code d'une classe objective C est contenue dans 2 fichers
 - un ficher header (.h)
 - un ficher d'implementation (.m)
 
 le ficher .h contient
 - le nom de la classe (précisé à l'aide de la directive @interface)
 - les propiétés et les méthode exportées par la classe
   Ces éléments publiques doivent etre définis entre @interface et @end
 */
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// définir une propriété 'nom' dont le portée depasse la frontiére de cette classe
@property (nonatomic, strong) NSString * nom;

//Remarques :
//Quand on crée une propriété, le compilateur objective c crée
//- une instance qui contient la valeur de la prpriété
//Cette variable d'instance porte, par défaut, le meme nom
//- un getter -port le nom de la propriété
//- un setter (si la propriété n'est pas en lecture seul)
//porte le nom de la propriété commencant par une majouscule et présédé par 'set'

@end

