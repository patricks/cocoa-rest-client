//
//  CRCSyntaxHighlightView.h
//  CocoaRestClient
//
//  Created by Diego Massanti on 10/2/14.
//
//

#import <WebKit/WebKit.h>
#import "GTMNSString+HTML.h"
#import <WebKit/WebKit.h>
#import <WebKit/WebFrameLoadDelegate.h>

@interface CRCSyntaxHighlightView : WebView {
}


- (void)setRawContent:(NSString*)theContent;

@end
