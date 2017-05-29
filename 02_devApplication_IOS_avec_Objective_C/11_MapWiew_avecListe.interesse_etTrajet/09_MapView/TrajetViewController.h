//
//  TrajetViewController.h
//  09_MapView
//
//  Created by etudiant on 4/24/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import "ViewController.h"

@interface TrajetViewController : ViewController <MKMapViewDelegate>
@property (nonatomic,strong) MKMapItem* destinationTrajet;
@end
