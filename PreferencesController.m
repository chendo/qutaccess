//
//  PreferencesController.m
//  QUTAccess
//
//  Created by chendo on 15/09/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PreferencesController.h"


@implementation PreferencesController

- (IBAction) checkAuthDetails:(id) sender {
	NSLog(@"check auth details");
}

- (void)awakeFromNib {
	NSLog(@"awake from nib preferences");
	//[window setExcludedFromWindowsMenu:];
	[window makeKeyAndOrderFront:nil];
}

- (void) dealloc {
	NSLog(@"dealloc preferecences");
	[super dealloc];
}
@end
