//
//  BuilderViewController.m
//  Karel
//
//  Created by Ivan Vasilevich on 4/9/14.
//  Copyright (c) 2014 Ivan Vasilevich. All rights reserved.
//

#import "BuilderViewController.h"
#import "DrawingView.h"

#define kPathsKey @"paths"

@interface BuilderViewController () <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet DrawingView *drwView;
@property (nonatomic) CGPoint startPoint;
@property (weak, nonatomic) IBOutlet UILabel *info;
@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) NSString *worldName;
@end

@implementation BuilderViewController

- (IBAction)saveWorld {
    
    UIAlertView *alert = [[UIAlertView alloc] init];
    [alert setDelegate:self];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert setTitle:@"Game Over"];
    [alert setMessage:@"You won\nEnter your name"];
    [alert addButtonWithTitle:@"Ok"];
    [alert setCancelButtonIndex:0];
    [alert show];

	NSString *worldPath = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], self.worldName];
    if ([NSKeyedArchiver archiveRootObject:self.drwView.paths toFile:worldPath]) {
		NSLog(@"saved to:\n%@", worldPath);
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	
    if ([[alertView textFieldAtIndex:0].text length]) {
        self.worldName = [alertView textFieldAtIndex:0].text;
    }
	
	
}


- (IBAction)undo {
    [self.drwView.paths removeLastObject];
    [self.drwView setNeedsDisplay];
}
- (IBAction)pan:(UIPanGestureRecognizer *)sender {
	NSLog(@"pan");
    if (sender.state == UIGestureRecognizerStateEnded) {
        if (CGPointEqualToPoint(self.startPoint, CGPointZero)) {
            int x = [sender locationInView:self.drwView].x/HERO_SIZE;
            int y = [sender locationInView:self.drwView].y/HERO_SIZE;
            self.startPoint = CGPointMake(x*HERO_SIZE, y*HERO_SIZE);
        } else {
            UIBezierPath *newPath = [[UIBezierPath alloc] init];
            [newPath moveToPoint:self.startPoint];
            int x = [sender locationInView:self.drwView].x/HERO_SIZE;
            int y = [sender locationInView:self.drwView].y/HERO_SIZE;
            [newPath addLineToPoint:CGPointMake(x*HERO_SIZE, y*HERO_SIZE)];
            [newPath closePath];
            [self.drwView.paths addObject:newPath];
            [self.drwView setNeedsDisplay];
            self.startPoint = CGPointZero;
            
        }

    } else {
    int x = [sender locationInView:self.drwView].x/HERO_SIZE;
    int y = [sender locationInView:self.drwView].y/HERO_SIZE;
        self.info.text = [NSString stringWithFormat:@"x:%i y:%i", x, y];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)addNewLine:(UIPanGestureRecognizer *)sender {
	NSLog(@"pan2");
	if (CGPointEqualToPoint(self.startPoint, CGPointZero)) {
		int x = [sender locationInView:self.drwView].x/HERO_SIZE;
		int y = [sender locationInView:self.drwView].y/HERO_SIZE;
		self.startPoint = CGPointMake(x*HERO_SIZE, y*HERO_SIZE);
	}
	else {
		[self.path moveToPoint:self.startPoint];
		int x = [sender locationInView:self.drwView].x/HERO_SIZE;
		int y = [sender locationInView:self.drwView].y/HERO_SIZE;
		[self.path addLineToPoint:CGPointMake(x*HERO_SIZE, y*HERO_SIZE)];
		[self.path closePath];
		self.drwView.pathToDraw = self.path;
		[self.drwView setNeedsDisplay];
		self.startPoint = CGPointZero;
		
	}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.startPoint = CGPointZero;
    
    self.path = [[UIBezierPath alloc] init];
    [self.path moveToPoint:CGPointZero];
    [self.path addLineToPoint:CGPointMake(32, 64)];
    [self.path closePath];
    
//    [[UIColor greenColor] setStroke];
//    [path stroke];
    self.drwView.pathToDraw = self.path;
    [self.drwView setNeedsDisplay];
    // Do any additional setup after loading the view.
}


@end
