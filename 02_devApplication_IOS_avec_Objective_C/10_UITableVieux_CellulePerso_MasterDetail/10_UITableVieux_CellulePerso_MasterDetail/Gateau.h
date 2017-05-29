//
//  Gateau.h
//  10_UITableVieux_CellulePerso_MasterDetail
//
//  Created by etudiant on 4/21/17.
//  Copyright © 2017 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gateau : NSObject

@property (nonatomic,strong)NSString * nomImage;
@property (nonatomic,strong)NSString * nom;
@property (nonatomic,strong)NSString * texte;

-(id)initNom:(NSString *)nom nomImage:(NSString *)nomImage description:(NSString *)description;
@end
