//
//  APBEntryController.h
//  Journal-C
//
//  Created by Austin Blaser on 9/26/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

#import <Foundation/Foundation.h>
@class APBEntry;

@interface APBEntryController : NSObject

- (void) addEntryWithTitle:(NSString *)title text:(NSString *)text;
- (void) deleteEntry:(APBEntry *)entry;
+ (APBEntryController *)sharedController;

@property NSArray *entries;

@end
