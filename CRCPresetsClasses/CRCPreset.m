//
//  CRCPreset.m
//  CocoaRestClient
//
//  Created by Diego Massanti on 10/3/14.
//
//

#import "CRCPreset.h"

@implementation CRCPreset

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"Unnamed Preset Fgt";
        _url = [NSURL URLWithString:@"http://google.com"];
        _method = @"GET";
    }
    return self;
}

@end
