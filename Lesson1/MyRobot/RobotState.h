//
//  RobotState.h
//  Robotics
//
//  Created by Ivan Vasilevich on 5/30/14.
//  Copyright (c) 2014 Ivan Vasilevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RobotState : NSObject

@property (nonatomic) CGRect rect;
@property (nonatomic) int candys;
@property (nonatomic) BOOL crashed;
@property (nonatomic, copy) NSString *dirrection;

- (instancetype)initWithState:(RobotState *)state;

@end
