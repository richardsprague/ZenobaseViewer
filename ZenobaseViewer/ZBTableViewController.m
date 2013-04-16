//
//  ZBTableViewController.m
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/14/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import "ZBTableViewController.h"

@interface ZBTableViewController() <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ZBTableViewController

- (void) setBuckets:(NSArray *)buckets

{ _buckets = buckets;
    [self.tableView reloadData];
}


- (NSString *)titleForRow:(NSUInteger)row
{
    return [self.buckets[row][@"label"] description]; // description because could be NSNull
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [self.buckets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Bucket Label";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self titleForRow:indexPath.row];
 //   cell.detailTextLabel.text = [self subtitleForRow:indexPath.row];
    
    
    return cell;
}

@end
