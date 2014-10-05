//
//  CRCSyntaxHighlightView.m
//  CocoaRestClient
//
//  Created by Diego Massanti on 10/2/14.
//
//

#import "CRCSyntaxHighlightView.h"


@implementation CRCSyntaxHighlightView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.frameLoadDelegate = self;
        self.resourceLoadDelegate = self;
        NSString *path = [[NSBundle mainBundle]pathForResource:@"template" ofType:@"html"];
        NSURL *base = [[[NSBundle mainBundle]resourceURL]URLByAppendingPathComponent:@"highlighter"];
        [[self mainFrame]loadHTMLString:[NSString stringWithContentsOfFile:path
                                                                 encoding:NSUTF8StringEncoding
                                                                    error:nil]
                                baseURL:base];
        [self.enclosingScrollView setBorderType:NSGrooveBorder];
        self.frameLoadDelegate = self;
        



    }
    return self;
}

- (void)awakeFromNib {
    [self.enclosingScrollView setBorderType:NSGrooveBorder];
}

- (void)setRawContent:(NSString *)theContent {
    NSString *escaped = [theContent gtm_stringByEscapingForAsciiHTML];
    
    id win = [self windowScriptObject];
    [win callWebScriptMethod:@"processText"
               withArguments:[NSArray arrayWithObjects:escaped, @"javascript", nil]];
}


- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame {
    id win = [sender windowScriptObject];
    [win callWebScriptMethod:@"processText"
               withArguments:[NSArray arrayWithObjects:@"Nothing yet loaded...", @"plain", nil]];
}

@end
