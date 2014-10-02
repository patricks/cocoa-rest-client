//
//  ExportRequestsDelegate.h
//  CocoaRestClient
//
//  Created by Michael Mattozzi on 1/15/12.
//  Copyright (c) 2012 Michael Mattozzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExportRequestsController : NSWindowController {
    NSMutableArray *__strong savedRequestsArray;
    NSMutableArray *requestsTableModel;
    NSTableView *__strong tableView;
    NSOutlineView *__strong savedOutlineView;
    
    NSButton *__strong importButton;
    NSButton *__strong exportButton;
    NSButton *__strong allButton;
    NSTextField *__strong label;
    BOOL isExportsWindow;
}

@property (strong, atomic) NSMutableArray *savedRequestsArray;
@property (strong, atomic) NSOutlineView *savedOutlineView;

@property (strong) IBOutlet NSTableView *tableView;
@property (strong) IBOutlet NSButton *importButton;
@property (strong) IBOutlet NSButton *exportButton;
@property (strong) IBOutlet NSButton *allButton;
@property (strong) IBOutlet NSTextField *label;

- (void) prepareToDisplayExports;
- (void) prepareToDisplayImports:(NSArray *)importRequests;
- (IBAction) confirmExport:(id)sender;
- (IBAction) cancelExport:(id)sender;
- (IBAction) clickedAllCheckbox:(id)sender;
- (IBAction) confirmImport:(id)sender;

@end
