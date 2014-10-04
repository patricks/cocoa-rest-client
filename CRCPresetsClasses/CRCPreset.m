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

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.name forKey:kPresetKeyName];
    [coder encodeObject:self.method forKey:kPresetKeyMethod];
    [coder encodeObject:self.url forKey:kPresetKeyURL];
    [coder encodeObject:self.request forKey:kPresetKeyRequest];
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        _name = [coder decodeObjectForKey:kPresetKeyName];
        _url = [coder decodeObjectForKey:kPresetKeyURL];
        _method = [coder decodeObjectForKey:kPresetKeyMethod];
        _request = [coder decodeObjectForKey:kPresetKeyRequest];
    }
    return self;
}

@end
