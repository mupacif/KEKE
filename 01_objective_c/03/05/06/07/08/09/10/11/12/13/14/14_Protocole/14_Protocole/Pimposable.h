//
//  Pimposable.h
//  14_Protocole
//
#import <Foundation/Foundation.h>

@protocol Pimposable <NSObject>

//définir les propriete et les methodes imposée par le protocole
-(float) calculerImpot;
@property (readonly)NSString * nomImpot;

@end

