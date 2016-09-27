//
//  APBEntryDetailViewController.m
//  Journal-C
//
//  Created by Austin Blaser on 9/26/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

#import "APBEntryDetailViewController.h"
#import "APBEntry.h"
#import "APBEntryController.h"

@interface APBEntryDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *textTextField;
-(void)updateViewWithEntry:(APBEntry *)entry;

@end

@implementation APBEntryDetailViewController

- (IBAction)saveButtonTapped:(id)sender {
    NSString *title = self.titleTextField.text;
    NSString *text = self.textTextField.text;
    
    
    [self.titleTextField resignFirstResponder];
    [self.textTextField resignFirstResponder];
    
    [[APBEntryController sharedController] addEntryWithTitle:title text:text];
    
    [self.navigationController popViewControllerAnimated:true];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.entry != nil){
        [self updateViewWithEntry:self.entry];
    }
    
    
}

-(void)updateViewWithEntry:(APBEntry *)entry
{
    self.title = entry.title;
    self.titleTextField.text = entry.title;
    self.textTextField.text = entry.text;
}




@end
