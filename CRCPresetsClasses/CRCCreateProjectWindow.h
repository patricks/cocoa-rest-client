//
//  CRCCreateProjectWindow.h
//  CocoaRestClient
//
//  Created by Diego Massanti on 10/4/14.
//
//

#import <Cocoa/Cocoa.h>
#import "CRCPreset.h"

@interface CRCCreateProjectWindow : NSWindow

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@property CRCPreset         *preset;

@end
