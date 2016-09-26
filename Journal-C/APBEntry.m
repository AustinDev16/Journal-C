//
//  APBEntry.m
//  Journal-C
//
//  Created by Austin Blaser on 9/26/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

#import "APBEntry.h"

@implementation APBEntry

-(instancetype)initWithTitle:(NSString *)title text:(NSString *)text
{
    self = [super init];
    if (self){
        _title = [title copy];
        _text = [text copy];
        _timestamp = [NSDate alloc];
    }
    return self;
}

@end
