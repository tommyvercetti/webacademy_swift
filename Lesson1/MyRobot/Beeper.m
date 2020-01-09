//
//  Beeper.m
//  Karel
//
//  Created by Ivan Vasilevich on 2/27/14.
//  Copyright (c) 2014 Ivan Vasilevich. All rights reserved.
//

#import "Beeper.h"

@implementation Beeper

- (NSString *)number {
	if (!_number) {
		_number = @"";
	}
	return _number;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setNeedsDisplay];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setNeedsDisplay];
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(0 + 2, self.frame.size.height/2)];
    [path addLineToPoint:CGPointMake(self.frame.size.width/2, 0 + 2)];
    [path addLineToPoint:CGPointMake(self.frame.size.width - 2, self.frame.size.height/2)];
    [path addLineToPoint:CGPointMake(self.frame.size.width/2, self.frame.size.height - 2)];
    [path closePath];
    path.lineWidth *= 2;
    [[UIColor blackColor] setStroke];
    [[UIColor grayColor] setFill];
    [path stroke];
    [path fill];
	UIFont *textFont = [UIFont fontWithName:@"HelveticaNeue-Medium" size:16];
	NSMutableAttributedString *number = [[NSMutableAttributedString alloc] initWithString: self.number  attributes:@{NSFontAttributeName : textFont}];
	[number drawAtPoint:CGPointMake(self.bounds.size.width/2 - number.size.width/2, self.bounds.size.height/2 - number.size.height/2)];

}


@end
