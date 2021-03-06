//
//  CRCPresetsController.h
//  CocoaRestClient
//
//  Created by Diego Massanti on 10/3/14.
//
//

#import <Foundation/Foundation.h>
#import "CRCProject.h"
#import "CRCPreset.h"
#import <Cocoa/Cocoa.h>
#import "CRCSavePresetWindow.h"
#import "CRCCreateProjectWindow.h"
#import "CocoaRestClientAppDelegate.h"


static NSString *kProjectsUserDefaultsKey = @"CRCProjects";

@class CRCProjectsArrayController;

@interface CRCPresetsController : NSObject <NSTableViewDelegate> {
}

@property (nonatomic) NSMutableArray        *projectsArray;
@property IBOutlet NSWindow                  *presetsWindow;
@property IBOutlet NSArrayController        *projectsArrayController;
@property IBOutlet NSArrayController        *presetsArrayController;
@property IBOutlet CRCSavePresetWindow      *addPresetWindow;
@property IBOutlet CRCCreateProjectWindow   *createProjectWindow;
@property CRCPreset                         *temporaryPreset;
@property CRCProject                        *temporaryProject;
@property (readonly) NSString               *toggleMenuLabel;



@end
