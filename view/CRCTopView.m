#import "CRCTopView.h"


@implementation CRCTopView

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
         bgGradient = [[NSGradient alloc]initWithStartingColor:[NSColor alternateSelectedControlColor]
                                                   endingColor:[NSColor keyboardFocusIndicatorColor]];
    }
    return self;
}

- (BOOL) isOpaque
{
	return NO;
}

- (void)drawRect:(NSRect)dirtyRect {
    [bgGradient drawInRect:self.bounds angle:90];
}

@end
