//
//  TabbingTableView.m
//  CocoaRestClient
//
//  Created by Michael Mattozzi on 2/25/12.
//  Copyright (c) 2012 Michael Mattozzi. All rights reserved.
//

#import "TabbingTableView.h"
#import "TableRowAndColumn.h"

@implementation TabbingTableView


// Remember the key the user pressed to end the editing action
- (void) textDidEndEditing: (NSNotification *) notification {
    int editedColumn = [self editedColumn];
    int editedRow = [self editedRow];
    NSTableColumn *currentColumn = [[self tableColumns] objectAtIndex:editedColumn];
    NSDictionary *userInfo = [notification userInfo];
    lastTextMovement = [[userInfo valueForKey:@"NSTextMovement"] intValue];
    [super textDidEndEditing: notification];
    if (textDidEndEditingAction) {
        TableRowAndColumn *tableRowAndColumn = [[TableRowAndColumn alloc] init];
        tableRowAndColumn.column = currentColumn;
        tableRowAndColumn.row = editedRow;
        NSString *selector = nil;
        switch (self.identity) {
            case TabbingTableIdentityHeaders:
                selector = @"doneEditingHeaderRow:";
                break;
            case TabbingTableIdentityParams:
                selector = @"doneEditingParamsRow:";
            default:
                selector = nil;
                break;
        }
        
        /*
         SELECTOR IS NOT KNOWN AT RUNTIME, THIS UGLY HACK IS
         SO THAT THE COMPILER IS HAPPY.
         */
        id del = [NSApplication sharedApplication].delegate;
        if (nil != selector && [del respondsToSelector:NSSelectorFromString(selector)]) {
            [del performSelector:NSSelectorFromString(selector)
                      withObject:tableRowAndColumn
                      afterDelay:0];
        }
        
    }
}

- (int) getLastTextMovement {
    return lastTextMovement;
}

- (void) setTextDidEndEditingAction: (SEL)action {
    textDidEndEditingAction = action;
}

@end
