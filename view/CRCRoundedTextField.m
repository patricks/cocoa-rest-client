//
//  CRCRoundedTextField.m
//  CocoaRestClient
//
//  Created by Diego Massanti on 10/4/14.
//
//

#import "CRCRoundedTextField.h"

@implementation CRCRoundedTextField

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = [NSColor clearColor];
        self.drawsBackground = NO;
        self.style = NSBackgroundStyleLight;
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    
    // Drawing code here.
    NSBezierPath *bp = [NSBezierPath bezierPathWithRoundedRect:self.bounds
                                                       xRadius:3 yRadius:3];
    if (self.style == NSBackgroundStyleLight) {
        [[NSColor alternateSelectedControlColor]setFill];
        [[NSColor alternateSelectedControlTextColor]setStroke];
        self.textColor = [NSColor whiteColor];
    } else {
        [[NSColor selectedControlColor]setFill];
        [[NSColor selectedControlTextColor]setStroke];
        self.textColor = [NSColor darkGrayColor];
    }
    
    [bp fill];
    [bp stroke];
    [super drawRect:dirtyRect];

}

-  (void)setBackgroundStyle:(NSBackgroundStyle)style {
    _style = style;
    //[self setNeedsDisplay];
}

@end
