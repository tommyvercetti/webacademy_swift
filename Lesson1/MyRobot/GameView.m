//
//  GameView.m
//  Karel
//
//  Created by Ivan Vasilevich on 4/8/14.
//  Copyright (c) 2014 Ivan Vasilevich. All rights reserved.
//

#import "GameView.h"

@interface GameView()


@end

@implementation GameView



- (NSMutableArray *)paths{
    if (!_paths) {
        _paths = [[NSMutableArray alloc] init];
    }
    return _paths;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}

- (void)setup{
    [self setNeedsDisplay];
    self.clipsToBounds = NO;
    self.contentMode = UIViewContentModeRedraw;

}



- (void)drawRect:(CGRect)rect
{
    
    
    for (UIBezierPath *path in self.paths) {
        [[UIColor blackColor] setStroke];
        path.lineWidth*=2;
        [path stroke];
    }
    
    UIBezierPath *marks = [[UIBezierPath alloc] init];
    
    int width = self.bounds.size.width/HERO_SIZE;
    width *= HERO_SIZE;
    
    int height = self.bounds.size.height/HERO_SIZE;
    height *= HERO_SIZE;
    
    [marks moveToPoint:CGPointZero];
    [marks addLineToPoint:CGPointMake(width-1, 0)];
    [marks addLineToPoint:CGPointZero];
    
    [marks addLineToPoint:CGPointMake(0, height-1)];
    [marks addLineToPoint:CGPointZero];
    
    [marks moveToPoint:CGPointMake(width, height)];
    [marks addLineToPoint:CGPointMake(width, 0+1)];
    [marks addLineToPoint:CGPointMake(width, height)];
    
    [marks addLineToPoint:CGPointMake(0+1, height)];
    [marks addLineToPoint:CGPointMake(width, height)];
    
//    [marks moveToPoint:CGPointMake(HERO_SIZE*2, 0)];
//    [marks addLineToPoint:CGPointMake(HERO_SIZE*2, HERO_SIZE*9)];
//    
//    [marks moveToPoint:CGPointMake(HERO_SIZE*4, 0)];
//    [marks addLineToPoint:CGPointMake(HERO_SIZE*4, HERO_SIZE*2)];
//    
//    [marks moveToPoint:CGPointMake(HERO_SIZE*7, 0)];
//    [marks addLineToPoint:CGPointMake(HERO_SIZE*7, HERO_SIZE*6)];
//    
//    [marks moveToPoint:CGPointMake(HERO_SIZE*8, 0)];
//    [marks addLineToPoint:CGPointMake(HERO_SIZE*8, HERO_SIZE*10)];
    
//  /*
    for (int y = 0; y<self.bounds.size.height/HERO_SIZE; y++) {
        for (int x = 0; x<self.bounds.size.width/HERO_SIZE; x++) {
            
            if (!y) {
                [[NSString stringWithFormat:@"%i",x+1]
                                drawAtPoint:CGPointMake(x*HERO_SIZE+HERO_SIZE/2-2, 0)
                             withAttributes:nil];
            }
            
            if (!x) {
                [[NSString stringWithFormat:@"%i",y+1] drawAtPoint:CGPointMake(0, y*HERO_SIZE+HERO_SIZE/2-7) withAttributes:nil];
            }
            
            [marks moveToPoint:CGPointMake(x*HERO_SIZE+HERO_SIZE/2,
                                          y*HERO_SIZE+HERO_SIZE/2+1)];
            [marks addLineToPoint:CGPointMake(x*HERO_SIZE+HERO_SIZE/2,
                                             y*HERO_SIZE+HERO_SIZE/2)];
            [marks closePath];
        }
        
    }
//    */
    
    [marks setLineWidth:2.5];
    [[UIColor redColor] setStroke];
    [marks stroke];
    [marks addClip];
    [self.paths addObject:marks];
}


@end
