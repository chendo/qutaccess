//
//  AppController.m
//  QUTAccess
//
//  Created by chendo on 6/09/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"
#import <SystemConfiguration/SystemConfiguration.h>


@implementation AppController

- (void) awakeFromNib{
  
  //Create the NSStatusBar and set its length
  statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength] retain];
  
  //Used to detect where our files are
  NSBundle *bundle = [NSBundle mainBundle];
  
  //Allocates and loads the images into the application which will be used for our NSStatusItem
  statusImage = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"Icon" ofType:@"png"]];
  
  //Sets the images in our NSStatusItem
  [statusItem setImage:statusImage];
  [statusItem setAlternateImage:statusImage];
  
  //Tells the NSStatusItem what menu to load
  [statusItem setMenu:statusMenu];
  //Sets the tooptip for our item
  [statusItem setToolTip:@"QUTAccess"];
  //Enables highlighting
  [statusItem setHighlightMode:YES];
  
  NSTimer *timer;
  timer = [NSTimer scheduledTimerWithTimeInterval:60.0
                                           target:self
                                         selector: @selector(updateTime)
                                         userInfo:nil
                                          repeats: YES];
}

- (void) updateIP {
  [self willChangeValueForKey:@"ip"];
  [self didChangeValueForKey:@"ip"];
}

-(IBAction)showPreferences:(id)sender {
	NSLog(@"preferences clicked");
}

- (void) dealloc {
  //Releases the 2 images we loaded into memory
  [statusImage release];
  //[statusHighlightImage release];
  [super dealloc];
}

- (NSString *) getAddressOfPrimaryInterface
{
  NSString *hostname;
  int i;
  SCDynamicStoreContext context = { 0, (void *)self, NULL, NULL, NULL };
  SCDynamicStoreRef dynStore = SCDynamicStoreCreate(
                                                    NULL,
                                                    (CFStringRef) [[NSBundle mainBundle] bundleIdentifier],
                                                    nil,
                                                    &context);
  NSArray * allKeys;
  
  NSString * primaryInterface;
  allKeys = [(NSArray *)SCDynamicStoreCopyKeyList(dynStore, CFSTR("State:/Network/Global/IPv4")) autorelease];
  for(i=0; i<[allKeys count]; i++)
  {

    NSDictionary * dict = [(NSDictionary *)
                           SCDynamicStoreCopyValue(dynStore, (CFStringRef)[allKeys objectAtIndex:i]) autorelease];
    primaryInterface = (NSString *) [dict objectForKey:@"PrimaryInterface"];
  }
  allKeys = [(NSArray *)SCDynamicStoreCopyKeyList(dynStore,
            CFStringCreateWithFormat(kCFAllocatorDefault,
                                     NULL,
                                     CFSTR("State:/Network/Interface/%@/IPv4"),
                                     primaryInterface)) autorelease];
  for(i=0; i<[allKeys count]; i++)
  {

    NSDictionary * dict = [(NSDictionary *)
                 SCDynamicStoreCopyValue(dynStore, (CFStringRef)[allKeys objectAtIndex:i]) autorelease];

    hostname = [[dict objectForKey:@"Addresses"] objectAtIndex:0];
  }
  
  return hostname;
}

- (NSString *) ip {
  return [self getAddressOfPrimaryInterface];
}

@end
