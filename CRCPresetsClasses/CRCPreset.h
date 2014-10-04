//
//  CRCPreset.h
//  CocoaRestClient
//
//  Created by Diego Massanti on 10/3/14.
//
//

#import <Foundation/Foundation.h>

static NSString *kPresetKeyName     = @"CRCPresetName";
static NSString *kPresetKeyURL      = @"CRCPresetURL";
static NSString *kPresetKeyMethod   = @"CRCPresetMethod";

@interface CRCPreset : NSObject <NSCoding>

@property NSString              *name;
@property NSURL                 *url;
@property NSString              *method;

@end
