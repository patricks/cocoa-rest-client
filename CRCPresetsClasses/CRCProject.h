//
//  CRCProject.h
//  CocoaRestClient
//
//  Created by Diego Massanti on 10/3/14.
//
//

#import <Foundation/Foundation.h>

static NSString *kProjectKeyName        = @"CRCProjectName";
static NSString *kProjectKeyPresets     = @"CRCProjectPresets";

@interface CRCProject : NSObject <NSCoding>

@property NSMutableArray            *presets;
@property NSString                  *name;

@end
