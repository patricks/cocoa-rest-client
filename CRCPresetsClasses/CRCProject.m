//
//  CRCProject.m
//  CocoaRestClient
//
//  Created by Diego Massanti on 10/3/14.
//
//

#import "CRCProject.h"


@implementation CRCProject


- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"Untitled Project...";
        _presets = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.name forKey:kProjectKeyName];
    [coder encodeObject:self.presets forKey:kProjectKeyPresets];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        _presets = [coder decodeObjectForKey:kProjectKeyPresets];
        _name = [coder decodeObjectForKey:kProjectKeyName];
    }
    return self;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"dsfsd");
}



@end
