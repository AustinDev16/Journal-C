//
//  APBEntryListTableViewController.m
//  Journal-C
//
//  Created by Austin Blaser on 9/26/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

#import "APBEntryListTableViewController.h"
#import "APBEntryController.h"
#import "APBEntry.h"
#import "APBEntryDetailViewController.h"

@interface APBEntryListTableViewController ()

@end

@implementation APBEntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Entries";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return  [[[APBEntryController sharedController] entries] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    APBEntry *entry = [[APBEntryController sharedController] entries][indexPath.row];
    
    cell.textLabel.text = entry.title;
    
    // Configure the cell...
    
    return cell;
}




// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        APBEntry *entryToDelete = [[APBEntryController sharedController] entries][indexPath.row];
        [[APBEntryController sharedController] deleteEntry:entryToDelete];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   

}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"toDetailFromExisiting"]){
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        APBEntryDetailViewController *detailTVC = [segue destinationViewController];
        APBEntryController *controller = [APBEntryController sharedController];
        APBEntry *selectedEntry = controller.entries[indexPath.row];
        
        detailTVC.entry = selectedEntry;
    }
}


@end
