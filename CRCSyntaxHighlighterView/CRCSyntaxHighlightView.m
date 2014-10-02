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
        NSLog(@"Base: %@", base.path);
        [[self mainFrame]loadHTMLString:[NSString stringWithContentsOfFile:path
                                                                 encoding:NSUTF8StringEncoding
                                                                    error:nil]
                                baseURL:base];
        

    }
    return self;
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
    /*DOMDocument* domDocument=[frame.webView mainFrameDocument];
    DOMElement* styleElement=[domDocument createElement:@"style"];
    [styleElement setAttribute:@"type" value:@"text/css"];
    DOMText* cssText=[domDocument createTextNode:@"body{font-size:14px;font-family:Courier}"];
    [styleElement appendChild:cssText];
    DOMElement* headElement=(DOMElement*)[[domDocument getElementsByTagName:@"head"] item:0];
    [headElement appendChild:styleElement];*/
    /*[self stringByEvaluatingJavaScriptFromString: @"updateHighlight" ];
    WebScriptObject *script = [self windowScriptObject];
    [script callWebScriptMethod:@"updateHighlight" withArguments:@[@"foo"]];*/
}

- (void)webView:(WebView *)sender didFailProvisionalLoadWithError:(NSError *)error forFrame:(WebFrame *)frame {
   // NSLog(@"sfsd");
}

- (void)webView:(WebView *)sender resource:(id)identifier didFailLoadingWithError:(NSError *)error fromDataSource:(WebDataSource *)dataSource {
    //NSLog(@"sfsd");
}


- (NSURLRequest*)webView:(WebView *)sender resource:(id)identifier willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponse fromDataSource:(WebDataSource *)dataSource {
    //NSLog(@"Requesting: %@", request.URL.absoluteString);
    return request;
}
@end
