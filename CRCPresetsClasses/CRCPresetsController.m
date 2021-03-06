//
//  CRCPresetsController.m
//  CocoaRestClient
//
//  Created by Diego Massanti on 10/3/14.
//
//

#import "CRCPresetsController.h"

@implementation CRCPresetsController


@synthesize toggleMenuLabel = _toggleMenuLabel;
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSMutableArray *projects = [self loadProjectsFromUserDefaults];
        _toggleMenuLabel = @"Show Presets Manager";
        self.projectsArray = projects;
        // Instead of having to observe each and every current (and future) property
        // in CRCProject and CRCpreset and synchronize when there is a change, it is easier to just
        // synchronize the whole projects array every 10 seconds.
        // This is not CPU/Disk consuming at all.
        [NSTimer scheduledTimerWithTimeInterval:10
                                         target:self
                                       selector:@selector(saveModificationsToDisk)
                                       userInfo:nil repeats:YES];
        
        [[NSNotificationCenter defaultCenter]addObserverForName:@"NSApplicationWillTerminateNotification"
                                                         object:nil
                                                          queue:nil
                                                     usingBlock:^(NSNotification *note) {
                                                         [self saveModificationsToDisk];
                                                     }];
        
        // handle window close events
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(windowWillClose:)
                                                     name:NSWindowWillCloseNotification
                                                   object:self.presetsWindow];
    }
    
    return self;
}

- (NSMutableArray*)loadProjectsFromUserDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:kProjectsUserDefaultsKey];
    NSMutableArray *projects = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return projects;
}

- (void)saveModificationsToDisk {
    NSData *encodedProjects = [NSKeyedArchiver archivedDataWithRootObject:self.projectsArray];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedProjects forKey:kProjectsUserDefaultsKey];
    [defaults synchronize];
}

- (IBAction)togglePresetsWindow:(id)sender {
    if (nil == self.presetsWindow) {
        [[NSBundle mainBundle]loadNibNamed:@"PresetsWindow" owner:self topLevelObjects:nil];
    }
    
    [self tooglePresetsMenuItem];
}

- (void)windowWillClose:(NSNotification *)notification {
    [self tooglePresetsMenuItem];
}

- (void)tooglePresetsMenuItem {
    if (self.presetsWindow.visible) {
        [self.presetsWindow orderOut:self];
        [self willChangeValueForKey:@"toggleMenuLabel"];
        _toggleMenuLabel = @"Show Presets Manager";
        [self didChangeValueForKey:@"toggleMenuLabel"];
    } else {
        [self.presetsWindow makeKeyAndOrderFront:self];
        [self willChangeValueForKey:@"toggleMenuLabel"];
        _toggleMenuLabel = @"Hide Presets Manager";
        [self didChangeValueForKey:@"toggleMenuLabel"];
    }
}

- (void)tableView:(NSTableView *)tableView didAddRowView:(NSTableRowView *)rowView forRow:(NSInteger)row {
    NSLog(@"foo");
}

- (BOOL)tableView:(NSTableView *)aTableView
  shouldSelectRow:(NSInteger)rowIndex {
    return YES;
}

- (IBAction)showSaveRequestSheet:(id)sender {
    if (nil == self.addPresetWindow) {
        [[NSBundle mainBundle]loadNibNamed:@"PresetsWindow" owner:self topLevelObjects:nil];
    }
    CRCPreset *newPreset = [[CRCPreset alloc]init];
    newPreset.name = @"Untitled Preset";
    
    self.temporaryPreset = newPreset;
    newPreset.request = [CRCRequest requestWithApplication:(CocoaRestClientAppDelegate*)[NSApplication sharedApplication].delegate];
    
    [[NSApp mainWindow] beginSheet:self.addPresetWindow
    completionHandler:^(NSModalResponse returnCode) {
        if (returnCode == NSModalResponseOK) {
            [self addNewPreset:newPreset];
        }
    }];
}

- (IBAction)showCreateProjectSheet:(id)sender {
    if (nil == self.createProjectWindow) {
        [[NSBundle mainBundle]loadNibNamed:@"PresetsWindow" owner:self topLevelObjects:nil];
    }
    CRCProject *newProject = [[CRCProject alloc]init];
    newProject.name = @"";
    self.temporaryProject = newProject;
    [self.addPresetWindow beginSheet:self.createProjectWindow
                 completionHandler:^(NSModalResponse returnCode) {
                     if (returnCode == NSModalResponseOK) {
                         [self addNewProject:self.temporaryProject];
                     }
                 }];
}

- (void)loadSavedRequest:(CRCRequest*)request {
    CocoaRestClientAppDelegate *del = (CocoaRestClientAppDelegate*)[NSApplication sharedApplication].delegate;
    [del loadSavedRequest:request];
}

#pragma mark -
#pragma mark Adding and Removing projects and presets

- (void)addNewProject:(CRCProject*)theProject {
    if (nil == self.projectsArray) self.projectsArray = [NSMutableArray array];
    [self.projectsArrayController addObject:theProject];
    [self saveModificationsToDisk];
}

- (void)removeProject:(CRCProject*)theProject {
    [self.projectsArrayController removeObject:theProject];
    [self saveModificationsToDisk];
}

- (void)addNewPreset:(CRCPreset*)thePreset {
    [self.presetsArrayController addObject:thePreset];
    [self saveModificationsToDisk];
}



@end
