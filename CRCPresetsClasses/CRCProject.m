//
//  CRCProject.m
//  CocoaRestClient
//
//  Created by Diego Massanti on 10/3/14.
//
//

#import "CRCProject.h"

static NSString *kCRCProjectKeyName = @"CRCProjectName";

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
- (id)copyWithZone:(NSZone *)zone {
    CRCProject *newProject = [[[self class]allocWithZone:zone]init];
    if (newProject) {
        newProject.name = @"Unnamed Project";
    }
    return newProject;
}



- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"dsfsd");
}



@end
