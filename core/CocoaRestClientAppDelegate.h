//
//  CocoaRestClientAppDelegate.h
//  CocoaRestClient
//
//  Created by mmattozzi on 1/5/10.
//  Copyright 2012 Michael Mattozzi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "ExportRequestsController.h"
#import "CRCDrawerView.h"
#import "TabbingTableView.h"
#import "PreferencesController.h"
#import "HighlightedTextView.h"
#import "WelcomeController.h"
#import "TableRowAndColumn.h"
#import "CRCSyntaxHighlightView.h"

extern NSString* const FOLLOW_REDIRECTS;
extern NSString* const RESPONSE_TIMEOUT;

@class CRCRequest;
@class CRCDrawerView;

@interface CocoaRestClientAppDelegate : NSObject <NSApplicationDelegate, NSTableViewDelegate, NSTableViewDataSource> {
    NSWindow *__strong window;
	
	NSComboBox *__strong urlBox;
	NSButton *__strong submitButton;
	NSTextView *__strong requestText;
	NSTextView *__strong responseText;
    WebView *__strong responseWebView;
    NSTextView *__strong requestHeadersSentText;
	NSTabViewItem *__strong headersTab;
	NSTextView *__strong responseTextHeaders;
    NSComboBox *__strong methodButton;
	TabbingTableView *__strong headersTableView;
	TabbingTableView *__strong filesTableView;
	TabbingTableView *__strong paramsTableView;
    HighlightedTextView *__strong responseView;
    HighlightedTextView *__strong requestView;
	NSComboBox *__strong responseSyntaxBox;
    
    NSTextView *__strong requestTextPlain;
    NSTextView *__strong responseTextPlain;
    NSScrollView *__strong responseTextPlainView;
    NSScrollView *__strong requestTextPlainView;
    
	NSTextField *__strong username;
	NSTextField *__strong password;
    BOOL preemptiveBasicAuth;
	
	NSMutableData *receivedData;
	NSString *contentType;
    NSString *charset;
	
	NSMutableArray *headersTable;
	NSMutableArray *filesTable;
	NSMutableArray *paramsTable;
	
	NSDrawer *__strong savedRequestsDrawer;
	NSMutableArray *savedRequestsArray;
	NSOutlineView *__strong savedOutlineView;
	
	NSPanel *__strong saveRequestSheet;
	NSTextField *__strong saveRequestTextField;
	
	NSPanel *__strong timeoutSheet;
	NSTextField *__strong timeoutField;
	
	ExportRequestsController *exportRequestsController;
    
    BOOL allowSelfSignedCerts;
    NSURLRequest *currentRequest;
    
	NSButton *__strong plusParam;
	NSButton *__strong minusParam;
	BOOL rawRequestInput;
	NSTabView *__strong tabView;
	NSTabViewItem *__strong reqHeadersTab;
	NSDate *startDate;
	NSTextField *__strong status;
    NSProgressIndicator *__strong progressIndicator;
    
    CRCDrawerView *__strong drawerView;
    PreferencesController *preferencesController;
    WelcomeController *welcomeController;
    
    NSMenuItem *__strong syntaxHighlightingMenuItem;
    NSMenuItem *__strong reGetResponseMenuItem;
    
    @private CRCRequest *lastRequest;
    
    @private NSSet *requestMethodsWithoutBody;
    
    @private NSArray *xmlContentTypes;    
    @private NSArray *jsonContentTypes;
    
    @private NSArray *msgPackContentTypes;
    
    @private NSString *appDataFilePath;
    
    id eventMonitor;	
}



@property (nonatomic, readonly) NSMutableArray *headersTable;
@property (nonatomic, readonly) NSMutableArray *filesTable;
@property (nonatomic, readonly) NSMutableArray *paramsTable;

@property (strong) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSComboBox *urlBox;
@property (strong) IBOutlet NSButton *submitButton;
@property (strong) IBOutlet NSTextView *responseText;

@property (strong) IBOutlet WebView *responseWebView;
@property (retain) IBOutlet HighlightedTextView *responseView;
@property (strong) IBOutlet NSComboBox *responseSyntaxBox;
@property (strong) IBOutlet HighlightedTextView *requestView;
@property (strong) IBOutlet NSTextView *responseTextHeaders;
@property (strong) IBOutlet NSComboBox *methodButton;
@property (strong) IBOutlet NSTextView *requestText;
@property (strong) IBOutlet TabbingTableView *headersTableView;
@property (strong) IBOutlet TabbingTableView *filesTableView;
@property (strong) IBOutlet TabbingTableView *paramsTableView;
@property (strong) IBOutlet NSTextField *username;
@property (strong) IBOutlet NSTextField *password;
@property (assign) BOOL preemptiveBasicAuth;
@property (strong) IBOutlet NSOutlineView *savedOutlineView;
@property (strong) IBOutlet NSPanel *saveRequestSheet;
@property (strong) IBOutlet NSTextField *saveRequestTextField;
@property (strong) IBOutlet NSDrawer *savedRequestsDrawer;
@property (strong) IBOutlet NSTabViewItem *headersTab;
@property (strong) IBOutlet NSPanel *timeoutSheet;
@property (strong) IBOutlet NSTextField *timeoutField;
@property (strong) IBOutlet NSButton *plusParam;
@property (strong) IBOutlet NSButton *minusParam;
@property (assign, nonatomic) BOOL rawRequestInput;
@property (strong) IBOutlet NSTabView *tabView;
@property (strong) IBOutlet NSTabViewItem *reqHeadersTab;
@property (strong) IBOutlet NSTextField *status;
@property (strong) IBOutlet NSTextView *requestHeadersSentText;
@property (strong) IBOutlet NSProgressIndicator *progressIndicator;
@property (strong) IBOutlet CRCDrawerView *drawerView;
@property (strong) PreferencesController *preferencesController;
@property (strong) IBOutlet NSTextView *requestTextPlain;
@property (strong) IBOutlet NSTextView *responseTextPlain;
@property (strong) IBOutlet NSScrollView *responseTextPlainView;
@property (strong) IBOutlet NSScrollView *requestTextPlainView;
@property (strong) IBOutlet NSMenuItem *syntaxHighlightingMenuItem;
@property (strong) IBOutlet NSMenuItem *reGetResponseMenuItem;
@property (strong) WelcomeController *welcomeController;

@property IBOutlet CRCSyntaxHighlightView *highlightView;

- (IBAction) runSubmit:(id)sender;
- (IBAction) doubleClickedHeaderRow:(id)sender;
- (IBAction) plusHeaderRow:(id)sender;
- (IBAction) minusHeaderRow:(id)sender;
- (IBAction) clearAuth:(id)sender;
- (IBAction) outlineClick:(id)sender;
- (IBAction) saveRequest:(id) sender;
- (IBAction) overwriteRequest:(id) sender;
- (IBAction) doneSaveRequest:(id) sender;
- (IBAction) createNewSavedFolder:(id)sender;
- (void) loadSavedRequest:(NSDictionary *) request;
- (IBAction) deleteSavedRequest:(id) sender;
- (NSString *) pathForDataFile;
- (void) loadDataFromDisk;
- (void) saveDataToDisk;
- (void) applicationWillTerminate: (NSNotification *)note;
- (IBAction) openTimeoutDialog:(id) sender;
- (IBAction) closeTimoutDialog:(id) sender;
- (IBAction) doubleClickedFileRow:(id)sender;
- (IBAction) plusFileRow:(id)sender;
- (IBAction) minusFileRow:(id)sender;
- (void) addFileToFilesTable: (NSURL*) fileUrl;
- (IBAction) doubleClickedParamsRow:(id)sender;
- (IBAction) plusParamsRow:(id)sender;
- (IBAction) minusParamsRow:(id)sender;
- (IBAction) contentTypeMenuItemSelected:(id)sender;
- (IBAction) handleOpenWindow:(id)sender;
- (IBAction) handleCloseWindow:(id)sender;
- (BOOL)validateMenuItem:(NSMenuItem *)item;
- (IBAction) helpInfo:(id)sender;
- (IBAction) licenseInfo:(id)sender;
- (IBAction) reloadLastRequest:(id)sender;
- (IBAction) allowSelfSignedCerts:(id)sender;
- (IBAction) importRequests:(id)sender;
- (IBAction) exportRequests:(id)sender;
- (void) importRequestsFromArray:(NSArray *)requests;
- (void) invalidFileAlert;
- (IBAction)deleteRow:(id)sender;
- (IBAction)showPreferences:(id)sender;
- (void)syntaxHighlightingPreferenceChanged;
- (IBAction) toggleSyntaxHighlighting:(id)sender;
- (IBAction) zoomIn:(id)sender;
- (IBAction) zoomOut:(id)sender;
- (IBAction) zoomDefault:(id)sender;
- (NSString *) saveResponseToTempFile;
- (IBAction) exportResponse:(id)sender;
- (IBAction) viewResponseInBrowser:(id)sender;
- (IBAction) reGetResponseInBrowser:(id)sender;
- (IBAction) viewResponseInDefaultApplication:(id)sender;
- (IBAction) updateResponseSyntaxHighlight:(id)sender;
- (void) showWelcome;
- (void) doneEditingHeaderRow:(TableRowAndColumn *)tableRowAndColumn;
- (void) doneEditingParamsRow:(TableRowAndColumn *)tableRowAndColumn;

- (void)setRawRequestInput:(BOOL)value;

- (void) initHighlightedViews;
//- (void) setHighlightSyntaxForMIME:(NSString*) mimeType;

@end
