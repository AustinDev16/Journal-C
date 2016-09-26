//
//  APBEntry.h
//  Journal-C
//
//  Created by Austin Blaser on 9/26/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APBEntry : NSObject

-(instancetype)initWithTitle:(NSString *)title text:(NSString *)text;

@property NSString *title;
@property NSString *text;
@property NSDate *timestamp;

@end
