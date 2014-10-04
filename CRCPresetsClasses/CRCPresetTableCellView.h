//
//  CRCPresetTableCellView.h
//  CocoaRestClient
//
//  Created by Diego Massanti on 10/4/14.
//
//

#import <Cocoa/Cocoa.h>
#import "CRCPreset.h"

@interface CRCPresetTableCellView : NSTableCellView

@property IBOutlet NSTextField          *lblPresetName;
@property IBOutlet NSTextField          *lblPresetMethod;
@property IBOutlet NSTextField          *lblPresetURL;

@end
