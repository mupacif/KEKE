//
//  ViewController.m
//  12_Timer
//
//  Created by etudiant on 4/25/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak,nonatomic) IBOutlet UILabel *etqAffichage;
@property (strong,nonatomic) NSTimer* horloge;
@property (nonatomic) int compteur;
@property (strong,nonatomic) UIColor* couleurStop;
@property (strong,nonatomic) UIColor* couleurStart;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.etqAffichage.text = @"0";
    //creer un timer
    [self creerHorloge];
    self.couleurStart = [UIColor whiteColor];
}

- (IBAction)btnStartStopTouch:(UIButton *)sender {
    //pour arreter un NSTimer, il faut le détruire (l'invalider)
    //pour savoir si un timer est en etat de fonctionnement, je teste la propriete isValid
    if (self.horloge.isValid) {
        [self.horloge invalidate];
        self.couleurStop = sender.currentTitleColor;
        [sender setTitle:@"Start" forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor blueColor]];
        [sender setTitleColor:self.couleurStart forState:UIControlStateNormal];
    } else {
        //une fois invalidée, une horloge ne peut plus etre re-valider
        //il faut en recreer une autre
        [self creerHorloge];
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor redColor]];
        [sender setTitleColor:self.couleurStop forState:UIControlStateNormal];
    }
}

-(void)onTopHorloge{
    self.compteur++;
    self.etqAffichage.text = [NSString stringWithFormat:@"%i",self.compteur];
}

-(void)creerHorloge{
    self.horloge = [NSTimer scheduledTimerWithTimeInterval:1
                                                    target:self
                                                  selector:@selector(onTopHorloge)//la methode qui sera appeller
                                                  userInfo:nil
                                                   repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
