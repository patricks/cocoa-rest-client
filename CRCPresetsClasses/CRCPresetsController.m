//
//  CRCPresetsController.m
//  CocoaRestClient
//
//  Created by Diego Massanti on 10/3/14.
//
//

#import "CRCPresetsController.h"

@implementation CRCPresetsController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _projectsArray = [[[NSUserDefaults standardUserDefaults]arrayForKey:@"CRCPresets"]mutableCopy];
        if (nil == _projectsArray) {
            NSLog(@"Presets dictionary not found, probably first start after presets migration... Creating empty dict.");
            _projectsArray = [[NSMutableArray alloc]init];
            [[NSUserDefaults standardUserDefaults]setObject:_projectsArray forKey:@"CRCPresets"];
        }
    
    }
    
    return self;
}

- (IBAction)showPresetsPanel:(id)sender {
    if (nil == self.presetsPanel) {
        [[NSBundle mainBundle]loadNibNamed:@"PresetsWindow" owner:self topLevelObjects:nil];
    }
    [self.presetsPanel makeKeyAndOrderFront:self];
}


- (void)tableView:(NSTableView *)tableView didAddRowView:(NSTableRowView *)rowView forRow:(NSInteger)row {
    NSLog(@"foo");
}

- (BOOL)tableView:(NSTableView *)aTableView
  shouldSelectRow:(NSInteger)rowIndex {
    return YES;
}

- (IBAction)saveRequest:(id)sender {
    if (nil == self.addPresetWindow) {
        [[NSBundle mainBundle]loadNibNamed:@"PresetsWindow" owner:self topLevelObjects:nil];
    }
    CRCPreset *newPreset = [[CRCPreset alloc]init];
    newPreset.name = @"Untitled Preset";
    self.temporaryPreset = newPreset;
    
    [[NSApp mainWindow] beginSheet:self.addPresetWindow
    completionHandler:^(NSModalResponse returnCode) {
        if (returnCode == NSModalResponseOK) {
            CRCProject *selectedProject = [self.projectsArrayController.selectedObjects objectAtIndex:0];
            [selectedProject willChangeValueForKey:@"presets"];
            [selectedProject.presets addObject:newPreset];
            [selectedProject didChangeValueForKey:@"presets"];
        }
    }];
}

- (IBAction)createProject:(id)sender {
    if (nil == self.createProjectWindow) {
        [[NSBundle mainBundle]loadNibNamed:@"PresetsWindow" owner:self topLevelObjects:nil];
    }
    CRCProject *newProject = [[CRCProject alloc]init];
    newProject.name = @"";
    self.temporaryProject = newProject;
    [self.addPresetWindow beginSheet:self.createProjectWindow
                 completionHandler:^(NSModalResponse returnCode) {
                     //
                     //self.createProjectWindow = nil;
                     if (returnCode == NSModalResponseOK) {
                         [self.projectsArrayController addObject:self.temporaryProject];
                         
                     }
                 }];
}



@end
