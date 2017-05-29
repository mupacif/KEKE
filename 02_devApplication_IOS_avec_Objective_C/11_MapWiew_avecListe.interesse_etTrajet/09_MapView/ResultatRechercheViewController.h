//
//  ResultatRechercheViewController.h
//  09_MapView
//
//  Created by etudiant on 4/24/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ResultatRechercheViewController : UIViewController <UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray* itemTrouves;
@end
