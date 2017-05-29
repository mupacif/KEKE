//
//  Utils.h
//  09_MapView
//
//  Created by etudiant on 4/25/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utils : NSObject
+(void)afficherAlerteAvecTitre:(NSString*)titre
                     etMessage:(NSString*)message
                      etParent:(UIViewController*)controller;
@end
