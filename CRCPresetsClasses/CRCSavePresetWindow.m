//
//  CRCSavePresetWindow.m
//  CocoaRestClient
//
//  Created by Diego Massanti on 10/4/14.
//
//

#import "CRCSavePresetWindow.h"

@implementation CRCSavePresetWindow



- (IBAction)cancel:(id)sender {
    [[NSApp mainWindow] endSheet:self returnCode:NSModalResponseCancel];
}

- (IBAction)save:(id)sender {
    [[NSApp mainWindow]endSheet:self returnCode:NSModalResponseOK];
}


@end
