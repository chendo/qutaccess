//
//  AppController.h
//  QUTAccess
//
//  Created by chendo on 6/09/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppController : NSObject {
  IBOutlet NSMenu *statusMenu;
  
  NSStatusItem *statusItem;
  NSImage *statusImage;
  NSImage *statusHighlightImage;
}

-(IBAction)showMenu:(id)sender;
-(NSString *)ip;

@end
