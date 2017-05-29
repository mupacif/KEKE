//
//  Vehicule.m
//  12_heritage
//


#import "Vehicule.h"

@interface Vehicule()

//propriété dont le scope est privée
@property (nonatomic)float vitesse;

//méthode dont le scope est privée
-(void) accelerer: (float) deltaVitesse;
@end
@implementation Vehicule

-(id)init
{
    self = [super init];
    if(self)
    {
        //initialisiser la valeur de là propriété vMaxAutoroute
        //comme cette propriété est readOnly je ne peux pas lui affecter une valeur avec self.vMaxAutoroute = 130;
        //ou
        //[self setVmaxAutoroute:130]
        //Solution: utilise la variable d'instace sur laquelle répose la propriété :
        _vMaxAutoroute = 130;
        //initialiser la vitesse du vehicule
        self.vitesse = 0; //ou alors _vitesse = 0;
 
    }
    return self;
} // fin init

//implementer la methode exportée 'conduir'
-(void)conduire
{
    NSLog(@"Je conduis ma %@ %@ de %.0f cm3",self.marque,self.modele,self.cylindree);
    [self accelerer:40];
    NSLog(@"Je roule a %.0f km/h",self.vitesse);
}

//implementer la methode local 'accelere'
-(void)accelerer:(float)deltaVitesse
{
    self.vitesse += deltaVitesse;
    
    //s'assurer que la vitesse finale n'est pas négative
    
    if(self.vitesse < 0)
        self.vitesse = 0;
}

//Overrider la méthode héritée 'description'
-(NSString*)description
{
    return [NSString stringWithFormat:@"%@ %@, de %.0f cm3",self.marque,self.modele,self.cylindree];
}
@end
