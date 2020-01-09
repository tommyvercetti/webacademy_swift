//
//  DrawingView.m
//  Karel
//
//  Created by Ivan Vasilevich on 4/9/14.
//  Copyright (c) 2014 Ivan Vasilevich. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}





// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
//    [super drawRect:rect];
    UIBezierPath *marks = [[UIBezierPath alloc] init];
    
    [marks moveToPoint:CGPointZero];
    [marks addLineToPoint:CGPointMake(self.bounds.size.width-1, 0)];
    [marks addLineToPoint:CGPointMake(0, 0)];
    [marks addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    [marks addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    [marks addLineToPoint:CGPointMake(self.bounds.size.width, 0)];
    [marks addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    [marks addLineToPoint:CGPointMake(0, self.bounds.size.height+HERO_SIZE)];
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
    
    [marks setLineWidth:1.5];
    [[UIColor redColor] setStroke];
    [marks stroke];

    
    
    for (UIBezierPath *path in self.paths) {
        [[UIColor greenColor] setStroke];
        [path stroke];
    }
    
}


@end
