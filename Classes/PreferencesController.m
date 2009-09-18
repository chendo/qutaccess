//
//  PreferencesController.m
//  QUTAccess
//
//  Created by chendo on 15/09/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PreferencesController.h"
#import "EMKeychainProxy.h"

@implementation PreferencesController

@synthesize username;
@synthesize password;

- (IBAction) checkAuthDetails:(id) sender {
	NSLog(@"check auth details");
}

- (void)awakeFromNib {
	NSLog(@"awake from nib preferences");
  self.username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
  EMKeychainItem* entry = [[EMKeychainProxy sharedProxy] genericKeychainItemForService:@"QUTAccess" withUsername: self.username];
  self.password = [entry password];
	//[window setExcludedFromWindowsMenu:];
	[window makeKeyAndOrderFront:nil];
}

- (void) dealloc {
	NSLog(@"dealloc preferecences");
	[super dealloc];
}

- (IBAction)onWindowClose:(id)sender {
    
}
@end
