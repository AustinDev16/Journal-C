//
//  APBEntryController.m
//  Journal-C
//
//  Created by Austin Blaser on 9/26/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

#import "APBEntryController.h"
#import "APBEntry.h"

@interface APBEntryController ()

@property NSMutableArray *internalEntries;

@end

@implementation APBEntryController

+(APBEntryController *)sharedController
{
    static APBEntryController *sharedController = nil; // make a snippet of this
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[self alloc] init];
    });
    return sharedController;
}

-(instancetype)init
{
    self = [super init];
    if (self){
        _internalEntries = [[NSMutableArray alloc] init];
    }
    return self;
}


-(void)addEntryWithTitle:(NSString *)title text:(NSString *)text
{
    APBEntry *newEntry = [[APBEntry alloc] initWithTitle:title text:text];
    [self.internalEntries addObject:newEntry];
}

-(void)deleteEntry:(APBEntry *)entry
{
    [self.internalEntries removeObject:entry];
}

-(NSArray *)entries { return self.internalEntries; }

@end
