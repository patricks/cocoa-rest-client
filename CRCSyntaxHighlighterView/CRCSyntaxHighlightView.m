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

    }
    return self;
}

- (void)awakeFromNib {

}

- (void)setRawContent:(NSString *)theContent {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"template" ofType:@"html"];
    NSURL *base = [[[NSBundle mainBundle]resourceURL]URLByAppendingPathComponent:@"highlighter"];

    NSString *template = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSString *escaped = [theContent gtm_stringByEscapingForAsciiHTML];
    template = [template stringByReplacingOccurrencesOfString:@"No Content" withString:escaped];
    [[self mainFrame]loadHTMLString:template baseURL:base];
}

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame {

  
}

@end
