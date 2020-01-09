//
//  RobotState.m
//  Robotics
//
//  Created by Ivan Vasilevich on 5/30/14.
//  Copyright (c) 2014 Ivan Vasilevich. All rights reserved.
//

#import "RobotState.h"

@implementation RobotState



- (instancetype)initWithState:(RobotState *)state{
   
    self = [super init];
    if (self) {
        self.dirrection = state.dirrection;
        self.candys = state.candys;
        self.rect = state.rect;
    }
    return self;
}

@end
