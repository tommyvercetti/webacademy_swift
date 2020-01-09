//
//  GameViewController.h
//  Karel
//
//  Created by Ivan Vasilevich on 2/25/14.
//  Copyright (c) 2014 Ivan Vasilevich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController

@property (nonatomic) NSTimeInterval delayTimeInterval;
@property (nonatomic, strong) NSString *levelName;
@property (nonatomic) dispatch_queue_t serialQueue;
@property (nonatomic) int actions;


- (void)performTasks;
- (void)displayWorldInfo;
//--------------------------------------------//
- (IBAction)move;
- (IBAction)turnRight;

- (IBAction)put;
- (IBAction)pick;



@property (nonatomic) BOOL frontIsClear;
@property (nonatomic) BOOL leftIsClear;
@property (nonatomic) BOOL rightIsClear;

@property (nonatomic) BOOL facingUp;
@property (nonatomic) BOOL facingDown;
@property (nonatomic) BOOL facingLeft;
@property (nonatomic) BOOL facingRight;

@property (nonatomic) BOOL candyPresent;
@property (nonatomic) BOOL candyInBag;


#pragma mark - inverse checkers

@property (nonatomic) BOOL frontIsBlocked;
@property (nonatomic) BOOL leftIsBlocked;
@property (nonatomic) BOOL rightIsBlocked;

@property (nonatomic) BOOL noFacingUp;
@property (nonatomic) BOOL noFacingDown;
@property (nonatomic) BOOL noFacingLeft;
@property (nonatomic) BOOL noFacingRight;

@property (nonatomic) BOOL noCandyPresent;
@property (nonatomic) BOOL noCandyInBag;


@end
