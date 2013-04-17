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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"ready to switch to next VC");
    
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if (indexPath) {
            if ([segue.identifier isEqualToString:@"Show Events"]) {
                if ([segue.destinationViewController respondsToSelector:@selector(didReceiveJSON:)]) {
                //    NSURL *url = [FlickrFetcher urlForPhoto:self.photos[indexPath.row] format:FlickrPhotoFormatLarge];
                   // [segue.destinationViewController performSelector:@selector(setImageURL:) withObject:url];
                    NSLog(@"after the segue I'll respond to your method");
      //              [segue.destinationViewController performSelector:@selector(setEvents:) buckets];
                  ZBEventVC *nextView = [segue destinationViewController];
                   nextView.bucketID = @"5fr9ofjjls";
                    [segue.destinationViewController setTitle:[self titleForRow:indexPath.row]];
                }
            }
        }
    }
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
