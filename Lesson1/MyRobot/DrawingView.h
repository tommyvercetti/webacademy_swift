//
//  DrawingView.h
//  Karel
//
//  Created by Ivan Vasilevich on 4/9/14.
//  Copyright (c) 2014 Ivan Vasilevich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameView.h"

@interface DrawingView : GameView


@property (nonatomic, strong) UIBezierPath *pathToDraw;

@end
