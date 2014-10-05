//
//  CRCPresetTableCellView.m
//  CocoaRestClient
//
//  Created by Diego Massanti on 10/4/14.
//
//

#import "CRCPresetTableCellView.h"

@implementation CRCPresetTableCellView


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self addObserver:self
               forKeyPath:@"objectValue"
                  options:NSKeyValueObservingOptionNew
                  context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"objectValue"]) {
        CRCPreset* preset = self.objectValue;
        self.lblPresetName.stringValue = preset.name;
        self.lblPresetMethod.stringValue = preset.request.method.uppercaseString;
        self.lblPresetURL.stringValue = preset.request.url;
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }

}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"objectValue"];
}

@end
