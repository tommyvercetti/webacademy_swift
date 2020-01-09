//
//  KerelView.m
//  Karel
//
//  Created by Ivan Vasilevich on 2/25/14.
//  Copyright (c) 2014 Ivan Vasilevich. All rights reserved.
//

#import "KerelView.h"


@interface KerelView()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation KerelView

@synthesize dirrection = _dirrection;

- (NSMutableArray *)candys{
    if (!_candys) {
        _candys = [[NSMutableArray alloc] init];
    }
    return _candys;
}



+ (NSArray *)dirrections{
    return @[@"Up", @"Right", @"Down", @"Left"];
}

- (NSString *)nextDirrection{
    int index = (int)[[KerelView dirrections] indexOfObject:self.dirrection];
    if (index + 1 == [[KerelView dirrections] count]) {
        index = -1;
    }
    NSString *nextDir = [[KerelView dirrections] objectAtIndex:(index+1)];
    return nextDir;
}

- (NSString *)prevDirrection{
    int index = (int)[[KerelView dirrections] indexOfObject:self.dirrection];
    if (!index) {
        index = 4;
    }
    NSString *nextDir = [[KerelView dirrections] objectAtIndex:(index-1)];
    return nextDir;
}


- (NSString *)dirrection{
    
    
    if (!_dirrection) {
        _dirrection = @"Right";
    }
    return _dirrection;
}

- (void)setDirrection:(NSString *)dirrection{
    _dirrection = dirrection;
    [self setNeedsDisplay];
}

- (void)move{
    
    if ([self.delegate frontIsClear]) {
       
        CGAffineTransform transform = self.transform;
        
        if ([self.dirrection isEqualToString:@"Right"]) {
            transform.tx += self.frame.size.width*2;
        } else if ([self.dirrection isEqualToString:@"Left"]) {
            transform.tx -= self.frame.size.width*2;
        } else if ([self.dirrection isEqualToString:@"Up"]) {
            transform.ty -= self.frame.size.height*2;
        } else if ([self.dirrection isEqualToString:@"Down"]) {
            transform.ty += self.frame.size.height*2;
        }
        
        [self setTransform:transform];
    }
    
}

- (void)turnRight{
    NSUInteger currentDirIndx = [[KerelView dirrections] indexOfObject:self.dirrection];
    if ([[KerelView dirrections] count] <= currentDirIndx+1) {
        currentDirIndx = 0;
    } else currentDirIndx++;
    self.dirrection = [[KerelView dirrections] objectAtIndex:currentDirIndx];
}


- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    [self setNeedsDisplay];
    self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:self.imageView];
}

- (void)drawRect:(CGRect)rect
{
    self.imageView.image = [UIImage imageNamed:self.dirrection];
}


@end
