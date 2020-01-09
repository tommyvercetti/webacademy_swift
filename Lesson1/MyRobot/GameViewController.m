//
//  GameViewController.m
//  Karel
//
//  Created by Ivan Vasilevich on 2/25/14.
//  Copyright (c) 2014 Ivan Vasilevich. All rights reserved.
//

#import <GLKit/GLKit.h>
#import "GameViewController.h"
#import "KerelView.h"
#import "GameView.h"
#import "RobotState.h"

@interface GameViewController () <KarelViewDelagate>



@property (strong, nonatomic) KerelView *karel;

@property (weak, nonatomic) IBOutlet UILabel *info;

@property (weak, nonatomic) IBOutlet UILabel *whatIsClear;

@property (weak, nonatomic) IBOutlet GameView *gameView;

@property (strong, nonatomic)NSMutableArray *beepers;

@property (strong, nonatomic)NSMutableArray *beepersLabels;

@property (strong, nonatomic)NSMutableArray *candyToRemove;

@property (strong, nonatomic)NSMutableArray *candyToShow;

@property (nonatomic, strong) NSMutableArray *robotTasks;

@property (nonatomic, strong) NSTimer *clock;

@property (nonatomic, strong) RobotState *prevState;

@property (nonatomic) float timeInterval;

@property (weak, nonatomic) IBOutlet UILabel *actsLabel;

@property (weak, nonatomic) IBOutlet UILabel *candyLabel;

@end


@implementation GameViewController

- (IBAction)pick {
        self.actions++;
    RobotState *newState = [[RobotState alloc] initWithState:[self.robotTasks lastObject]];
    
    BOOL succsess = NO;
    
    for (Beeper *beep in [self.beepers copy]) {

        if (CGRectContainsRect(beep.frame, newState.rect)) {
            [self.candyToRemove addObject:beep];
            [self.beepers removeObject:beep];
            
            succsess = YES;
            newState.candys++;
            NSLog(@"PICK CANDY");
            break;
        }
    }
    if (!succsess) NSLog(@"NO CANDY");
    
    [self.robotTasks addObject:newState];
    
}

- (IBAction)put {
        self.actions++;
    RobotState *newState = [[RobotState alloc] initWithState:[self.robotTasks lastObject]];
    
    Beeper *newBeeper = [[Beeper alloc] init];
    
    if (newBeeper && newState.candys > 0) {

        newState.candys--;
//        [self.karel.candys removeLastObject];
        newBeeper.frame = newState.rect;
        [self.candyToShow addObject:newBeeper];
        [self.beepers addObject:newBeeper];
        
        NSLog(@"PUT CANDY");
    }
	else NSLog(@"NO CANDY TO PUT");
    
    [self.robotTasks addObject:newState];
}



- (void)doOneAction:(NSTimer *)timer{

    if ([self.robotTasks count]) {
        __weak GameViewController *weakSelf = self;
        [UIView animateWithDuration:self.timeInterval animations:^{
            RobotState *state = [self.robotTasks objectAtIndex:0];
            if (state.crashed) {
                [self.clock invalidate];
                self.view.backgroundColor = [UIColor redColor];
            }
            RobotState *oldState = self.prevState;
            if (oldState) {
                if (state.candys > oldState.candys) {
                    for (Beeper *beep in [self.candyToRemove copy]) {
                        //                    CGRect bRect = beep.frame;
                        if (CGRectContainsRect(beep.frame, state.rect)) {
                            [self.candyToRemove removeObject:beep];
                            [beep removeFromSuperview];
                            
                            NSLog(@"Pick candy");
                            break;
                        }
                    }
                }
				else if (state.candys < oldState.candys) {
                    
                    Beeper *newBeeper = [self.candyToShow firstObject];
                    
                    [newBeeper setFrame:state.rect];
                    //                [self.beepers addObject:newBeeper];
                    NSLog(@"Put candy");
                    [self.gameView addSubview:newBeeper];
                    [self.candyToShow removeObject:newBeeper];
                    [self.gameView bringSubviewToFront:self.karel];
                    
                }
				[self countAndDisplayBeepers];
            }
            
            
            weakSelf.karel.dirrection = state.dirrection;
            weakSelf.karel.frame = state.rect;
            
            self.prevState = state;
            [self.robotTasks removeObject:state];
            

        }];
        //        [self updateUserInfo];
        
    }
    else {

        [self.clock invalidate];
        [self displayWorldInfo];
        
    }
    
    
}

- (NSMutableArray *)beepersLabels {
	if (!_beepersLabels) {
		_beepersLabels = [[NSMutableArray alloc] init];
	}
	return _beepersLabels;
}

- (void)countAndDisplayBeepers {
	NSMutableDictionary *count = [NSMutableDictionary new];
	for (Beeper *beep in self.gameView.subviews) {
		if ([beep isKindOfClass:[Beeper class]]) {
			NSString *key = [NSString stringWithFormat:@"x:%0.1f\ty:%0.1f", beep.frame.origin.x, beep.frame.origin.y];
			NSNumber *countOfBeepersAtPoint = @(1);
			if ([count objectForKey:key] != nil) {
				countOfBeepersAtPoint = @([[count objectForKey:key] intValue] + 1);
			}
			[count setObject:countOfBeepersAtPoint forKey:key];
			beep.number = [countOfBeepersAtPoint description];
//			NSLog(@"COUNT %@ = %@", key, beep.number);
			[beep setNeedsDisplay];
		}
	}
}

- (NSMutableArray *)beepers{
    if (!_beepers) {
        _beepers = [[NSMutableArray alloc] init];
    }
    return _beepers;
}

- (NSMutableArray *)candyToRemove{
    if (!_candyToRemove) {
        _candyToRemove = [[NSMutableArray alloc] init];
    }
    return _candyToRemove;
}

- (NSMutableArray *)candyToShow{
    if (!_candyToShow) {
        _candyToShow = [[NSMutableArray alloc] init];
    }
    return _candyToShow;
}

- (NSMutableArray *)robotTasks{
    if (!_robotTasks) {
        _robotTasks = [[NSMutableArray alloc] init];
    }
    return _robotTasks;
}

- (IBAction)changeRobotSpeed:(UISlider *)sender {

    self.timeInterval = 2 - sender.value;
    
}


- (void)performTasks{
    
    self.clock = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:self.timeInterval target:self selector:@selector(doOneAction:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.clock forMode:NSRunLoopCommonModes];

}




- (CGPoint)frontPoint{
    return [self frontPointForDirrection:nil];
}

- (CGPoint)frontPointForDirrection:(NSString *)dirrection{
    
    CGPoint front = CGPointZero;
    RobotState *currentState = [[RobotState alloc] initWithState:[self.robotTasks lastObject]];
    CGRect frame = currentState.rect;
    if (!dirrection) {
        dirrection = currentState.dirrection;
    }
    

    if ([dirrection isEqualToString:@"Up"]) {

        front = CGPointMake(frame.origin.x+HERO_SIZE/2,
                            frame.origin.y);
    
    } else if ([dirrection isEqualToString:@"Down"]) {
        
        front = CGPointMake(frame.origin.x+HERO_SIZE/2,
                            frame.origin.y+HERO_SIZE);
        
    } else if ([dirrection isEqualToString:@"Right"]) {
        
        front = CGPointMake(frame.origin.x+HERO_SIZE,
                            frame.origin.y+HERO_SIZE/2);
        
        
    } else if ([dirrection isEqualToString:@"Left"]) {
        
        front = CGPointMake(frame.origin.x,
                            frame.origin.y+HERO_SIZE/2);
    }
    

    return front;
}

#pragma mark - robotCheckers

- (BOOL)frontIsClear{
        self.actions++;
    int answer = [self frontIsClearSyst];
    if (!answer) {
        NSLog(@"FRONT IS BLOCKED");
    } else NSLog(@"FRONT IS CLEAR");
    return answer;
}

- (BOOL)frontIsClearSyst{
    int answer = 0;
    for (UIBezierPath *path in self.gameView.paths) {
        if ([path containsPoint:self.frontPoint]) {
            answer++;
        }
    }
    
    return !answer;
}

- (BOOL)leftIsClear{
    self.actions++;
    int answer = 0;
    for (UIBezierPath *path in self.gameView.paths) {
        int indx = (int)[[KerelView dirrections]
                    indexOfObject:((RobotState *)[self.robotTasks lastObject]).dirrection];
        if (!indx) {
            indx = 3;
        } else if (indx > 0 && indx < 3) indx--;
        else indx = 0;
        self.karel.dirrection = ((RobotState *)[self.robotTasks lastObject]).dirrection;
        NSString *leftSideDir = [self.karel prevDirrection];
        if ([path containsPoint:[self frontPointForDirrection:leftSideDir]]) {
            answer++;
        }
    }
    if (!answer) {
        NSLog(@"LEFT IS CLEAR ");
    } else NSLog(@"LEFT IS BLOCKED");
    return !answer;
}

- (BOOL)rightIsClear{
        self.actions++;
    int answer = 0;
    for (UIBezierPath *path in self.gameView.paths) {
        int indx = (int)[[KerelView dirrections]
                    indexOfObject:((RobotState *)[self.robotTasks lastObject]).dirrection];
        if (!indx) {
            indx = 3;
        } else if (indx > 0 && indx < 3) indx--;
        else indx = 0;
        self.karel.dirrection = ((RobotState *)[self.robotTasks lastObject]).dirrection;
        NSString *rightSideDir = [self.karel nextDirrection];
        if ([path containsPoint:[self frontPointForDirrection:rightSideDir]]) {
            answer++;
        }
    }
    
    if (!answer) {
        NSLog(@"RIGHT IS CLEAR");
    } else NSLog(@"RIGHT IS BLOCKED");
    
    return !answer;
}

- (BOOL)candyPresent{
        self.actions++;
    for (Beeper *bee in self.beepers) {
        if (CGRectContainsRect(bee.frame, ((RobotState *)[self.robotTasks lastObject]).rect)) {
            return YES;
            break;
        }
    }
    return NO;
}

- (BOOL)candyInBag{
        self.actions++;
    if (((RobotState *)[self.robotTasks lastObject]).candys > 0) {
        return YES;
    }
    return NO;
}

- (BOOL)facingUp{
        self.actions++;
    return [((RobotState *)[self.robotTasks lastObject]).dirrection isEqualToString:@"Up"];
}

- (BOOL)facingDown{
        self.actions++;
    return [((RobotState *)[self.robotTasks lastObject]).dirrection isEqualToString:@"Down"];
}

- (BOOL)facingLeft{
        self.actions++;
    return [((RobotState *)[self.robotTasks lastObject]).dirrection isEqualToString:@"Left"];
}

- (BOOL)facingRight{
        self.actions++;
    return [((RobotState *)[self.robotTasks lastObject]).dirrection isEqualToString:@"Right"];
}


#pragma mark - inverseRobotCheckers

- (BOOL)frontIsBlocked{
    return ![self frontIsClearSyst];
}

- (BOOL)leftIsBlocked{
    return ![self leftIsClear];
}

- (BOOL)rightIsBlocked{
    return ![self rightIsClear];
}

- (BOOL)noFacingUp{
    return ![self facingUp];
}

- (BOOL)noFacingDown{
    return ![self facingDown];
}

- (BOOL)noFacingLeft{
    return ![self facingLeft];
}

- (BOOL)noFacingRight{
    return ![self facingRight];
}

- (BOOL)noCandyPresent{
    return ![self candyPresent];
}

- (BOOL)noCandyInBag{
    return ![self candyInBag];
}


#pragma mark - robotCommands

- (void)displayCurrentPosAndDirrection {
    NSLog(@"x:%.0f y:%.0f dirrection:%@", self.karel.frame.origin.x/HERO_SIZE+1, self.karel.frame.origin.y/HERO_SIZE+1, self.karel.dirrection);
}

- (IBAction)move {
    self.actions++;
    RobotState *newState = [[RobotState alloc] initWithState:[self.robotTasks lastObject]];
    if ([self frontIsClearSyst]) {
        
        CGRect newFrame = newState.rect;
        CGPoint newPoint = newFrame.origin;
        if ([newState.dirrection isEqualToString:@"Up"]) newPoint.y-=HERO_SIZE;
        else if ([newState.dirrection isEqualToString:@"Right"]) newPoint.x+=HERO_SIZE;
        else if ([newState.dirrection isEqualToString:@"Down"]) newPoint.y+=HERO_SIZE;
        else if ([newState.dirrection isEqualToString:@"Left"]) newPoint.x-=HERO_SIZE;
        newFrame.origin = newPoint;
        
        newState.rect = newFrame;
        
        
//        [self.karel setFrame:newFrame];
//        [self displayCurrentPosAndDirrection];
    } else {
        NSLog(@"ROBOT CRASH");
        newState.crashed = YES;
    }
    [self.robotTasks addObject:newState];
    

}

- (IBAction)turnRight {
        self.actions++;
    RobotState *newState = [[RobotState alloc] initWithState:[self.robotTasks lastObject]];
    NSUInteger currentDirIndx = [[KerelView dirrections] indexOfObject:newState.dirrection];
    if ([[KerelView dirrections] count] <= currentDirIndx+1) {
        currentDirIndx = 0;
    } else currentDirIndx++;
    newState.dirrection = [[KerelView dirrections] objectAtIndex:currentDirIndx];
    
    [self.robotTasks addObject:newState];
    
//        [self.karel turnRight];
//        [self displayCurrentPosAndDirrection];

}

- (void)displayWorldInfo {
    NSLog(@"candys in world %i", (int)[self.beepers count]);
    self.candyLabel.text = [NSString stringWithFormat:@"Candy: %i", (int)self.beepers.count];
    self.actsLabel.text = [NSString stringWithFormat:@"Actions: %i", self.actions];
}


#pragma mark - initializing

@synthesize karel = karel;

- (void)viewDidLoad {
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (self.levelName) {
        self.timeInterval = 0.1;
        //    locateRobot
        NSDictionary *params = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.plist", [[NSBundle mainBundle] resourcePath], self.levelName]];
        
        
        self.karel  = [[KerelView alloc] initWithFrame:CGRectMake
                       ([[[[params objectForKey:@"RPos"]
                           componentsSeparatedByString:@","] firstObject] intValue]*HERO_SIZE,[[[[params objectForKey:@"RPos"] componentsSeparatedByString:@","] lastObject] intValue]*HERO_SIZE,
                        HERO_SIZE, HERO_SIZE)];
        
        
        self.karel.backgroundColor = [UIColor clearColor];
        [self.karel setNeedsDisplay];
        [self.karel setDelegate:self];
        [self.gameView addSubview:self.karel];
        
        self.delayTimeInterval = 0.25;
        
        //    CandysInBag
        for (int i = 0; i < [[params objectForKey:@"CandysInBag"] intValue]; i++) {
            [self.karel.candys addObject:[[Beeper alloc] init]];
        }
        
        
//        save first state
        RobotState *firstState = [[RobotState alloc] init];
        firstState.rect = self.karel.frame;
        firstState.candys = (int)[self.karel.candys count];
        firstState.dirrection = self.karel.dirrection;
        [self.robotTasks addObject:firstState];
        
        
        //    CandysOnView
        NSArray *candys = [params objectForKey:@"Candys"];
        
        for (int i = 0; i<[candys count]; i++) {
            int x = [[[candys[i] componentsSeparatedByString:@","] firstObject] intValue];
            int y = [[[candys[i] componentsSeparatedByString:@","] lastObject] intValue];
            CGRect beepFrame = self.karel.frame;
            beepFrame.origin.x = HERO_SIZE*x;
            beepFrame.origin.y = HERO_SIZE*y;
            Beeper *beep = [[Beeper alloc] initWithFrame:beepFrame];
            [self.beepers addObject:beep];
            [self.gameView addSubview:beep];
        }
        
        
        
        // lines on view
        NSArray *paths = [NSKeyedUnarchiver unarchiveObjectWithFile:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], self.levelName]];
        [self.gameView.paths addObjectsFromArray:paths];
        [self.gameView setNeedsDisplay];
        
        [self.gameView bringSubviewToFront:self.karel];
//        [self displayCurrentPosAndDirrection];

//        [self updateUserInfo];
        
    }
	else {
		NSLog(@"AHTUNG LEVEL NAME NOT SET!!!");
	}
	
	// CreateDrink (POST https://parseapi.back4app.com/classes/Drink)
	
	NSURL* URL = [NSURL URLWithString:@"https://parseapi.back4app.com/classes/Run"];
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:URL];
	request.HTTPMethod = @"POST";
	
	// Headers
	// RoboTrack
	
	
	[request addValue:@"TE73KiYxTTaEQm9Tw12VKLmUMnaMqu9F54tsgnuG" forHTTPHeaderField:@"X-Parse-REST-API-Key"];
	[request addValue:@"KTl4JTig4ffDWqArLcXxNiq5JGlrGAidP3FdyBWN" forHTTPHeaderField:@"X-Parse-Application-Id"];
	[request addValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	// JSON Body
	NSInteger runCount = [[NSUserDefaults standardUserDefaults] integerForKey:@"runCount"];
	runCount++;
	[[NSUserDefaults standardUserDefaults] setInteger:runCount forKey:@"runCount"];
	NSDictionary* bodyObject = @{
								 @"runCount": @(runCount),
								 @"deviceId": [[[UIDevice currentDevice] identifierForVendor] UUIDString]
								 };
	request.HTTPBody = [NSJSONSerialization dataWithJSONObject:bodyObject options:kNilOptions error:NULL];
	
	// Connection
	
	NSURLConnection* connection = [NSURLConnection connectionWithRequest:request delegate:nil];
	[connection start];
	
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[self countAndDisplayBeepers];
}


#pragma mark - debug

- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    for (UIBezierPath *path in self.gameView.paths) {
        if ([path containsPoint:[sender locationInView:self.gameView]]) {
            //            NSLog(@"opopopopopo");
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                [self.karel setFrame:CGRectMake(arc4random()%768, arc4random()%768, HERO_SIZE, HERO_SIZE)];
            } completion:^(BOOL finished) {
                NSLog(@"complete");
            }];
        }
    }
    
    self.info.text = [NSString stringWithFormat:@"x:%.0f y:%.0f",[sender locationInView:self.gameView].x, [sender locationInView:self.gameView].y];
}

- (void)updateUserInfo {
    [self displayCurrentPosAndDirrection];
    self.whatIsClear.text = [NSString stringWithFormat:@"Front:%i Left:%i Right:%i", [self frontIsClearSyst], [self leftIsClear], [self rightIsClear]];

}

@end
