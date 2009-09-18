//
//  PreferencesController.h
//  QUTAccess
//
//  Created by chendo on 15/09/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PreferencesController : NSObject {
  IBOutlet id window;
  NSString* username;
  NSString* password;
}
- (IBAction)onWindowClose:(id)sender;
- (IBAction) checkAuthDetails:(id) sender;

@property (copy, nonatomic) NSString* username;
@property (copy, nonatomic) NSString* password;
@end
