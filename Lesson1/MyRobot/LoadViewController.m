//
//  LoadViewController.m
//  Karel
//
//  Created by Ivan Vasilevich on 4/10/14.
//  Copyright (c) 2014 Ivan Vasilevich. All rights reserved.
//

#import "LoadViewController.h"
#import "DrawingView.h"

#define kPathsKey @"paths"

@interface LoadViewController ()

@property (weak, nonatomic) IBOutlet DrawingView *gView;

@end

@implementation LoadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.gView.paths = [NSKeyedUnarchiver unarchiveObjectWithFile:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], kPathsKey]];
    [self.gView setNeedsDisplay];
}
@end
