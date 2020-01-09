//
//  GameView.h
//  Karel
//
//  Created by Ivan Vasilevich on 4/8/14.
//  Copyright (c) 2014 Ivan Vasilevich. All rights reserved.
//

#import <UIKit/UIKit.h>


static const CGFLOAT_TYPE HERO_SIZE = 64;
#define kPathsKey @"paths"

@interface GameView : UIView



@property (nonatomic, strong) NSMutableArray *paths;

@end
