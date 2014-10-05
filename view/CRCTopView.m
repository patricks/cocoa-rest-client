#import "CRCTopView.h"


@implementation CRCTopView



- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeGradient];
        [[NSNotificationCenter defaultCenter]addObserverForName:@"NSControlTintDidChangeNotification"
                                                         object:nil
                                                          queue:nil
                                                     usingBlock:^(NSNotification *note) {
                                                         [self initializeGradient];
                                                     }];
    }
    
    return self;
}

- (void)initializeGradient {
    NSColor *currentTintColor;
    if ([NSColor currentControlTint] == NSBlueControlTint) {
        currentTintColor = [NSColor colorWithCalibratedRed:0.188 green:0.514 blue:0.984 alpha:1.000];
    } else {
        currentTintColor = [NSColor colorForControlTint:[NSColor currentControlTint]];
    }
    topColor = [self darkerColorForColor:currentTintColor darknessFactor:0.90];
    bottomColor = [self darkerColorForColor:currentTintColor darknessFactor:0.75];
    bgGradient = [[NSGradient alloc]initWithStartingColor:topColor
                                              endingColor:bottomColor];
    [self setNeedsDisplay:YES];

}

- (BOOL) isOpaque
{
	return NO;
}

- (void)drawRect:(NSRect)dirtyRect {

    
    [bgGradient drawInRect:self.bounds angle:-90];
}

- (NSColor *)darkerColorForColor:(NSColor *)c darknessFactor:(float)theFactor
{
    const CGFloat *components = CGColorGetComponents(c.CGColor);
    NSColor * convertedColor = [NSColor colorWithColorSpace:[NSColorSpace genericRGBColorSpace]
                                                 components:components
                                                      count:4];
    return [NSColor colorWithDeviceRed:convertedColor.redComponent * theFactor
                                 green:convertedColor.greenComponent * theFactor
                                  blue:convertedColor.blueComponent * theFactor
                                 alpha:convertedColor.alphaComponent];
}

@end
