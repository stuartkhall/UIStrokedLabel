//
//  UIStrokedLabel.m
//  AngryBoys
//
//  Created by Stuart Hall on 27/07/11.
//

#import "UIStrokedLabel.h"

@implementation UIStrokedLabel

@synthesize strokeWidth;

- (void)drawTextInRect:(CGRect)rect {
    CGContextRef c = UIGraphicsGetCurrentContext();
    if (self.strokeWidth > 0.0 && self.shadowColor != nil) {
        CGContextSetLineWidth(c, self.strokeWidth);
        CGContextSetLineJoin(c, kCGLineJoinRound);
        CGContextSetTextDrawingMode(c, kCGTextStroke);
        UIColor *oldColor = self.textColor;
        self.textColor = self.shadowColor;
        [super drawTextInRect:rect];
        self.textColor = oldColor;
    }
    CGContextSetTextDrawingMode(c, kCGTextFill);
    [super drawTextInRect:rect];
}

@end
