//
//  KerelView.h
//  Karel
//
//  Created by Ivan Vasilevich on 2/25/14.
//  Copyright (c) 2014 Ivan Vasilevich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Beeper.h"



@protocol KarelViewDelagate <NSObject>

- (BOOL)frontIsClear;


@end

@interface KerelView : UIView


@property (nonatomic, strong) NSString *dirrection;
@property (nonatomic, strong) id <KarelViewDelagate> delegate;
@property (nonatomic, strong) NSMutableArray *candys;

- (void)move;
- (void)turnRight;

+ (NSArray *)dirrections;
- (NSString *)nextDirrection;
- (NSString *)prevDirrection;


@end
