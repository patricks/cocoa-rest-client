//
//  CRCCreateProjectWindow.m
//  CocoaRestClient
//
//  Created by Diego Massanti on 10/4/14.
//
//

#import "CRCCreateProjectWindow.h"

@implementation CRCCreateProjectWindow

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"SDF");
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"SDF");

    }
    return self;
}

- (IBAction)cancel:(id)sender {
    [self.sheetParent endSheet:self returnCode:NSModalResponseCancel];
   
}

- (IBAction)save:(id)sender {
    [self.sheetParent endSheet:self returnCode:NSModalResponseOK];
}

@end
