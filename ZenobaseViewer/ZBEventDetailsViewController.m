//
//  ZBEventDetailsViewController.m
//  ZenobaseViewer
//
//  Created by Richard Sprague on 2/26/14.
//  Copyright (c) 2014 Richard Sprague. All rights reserved.
//

#import "ZBEventDetailsViewController.h"

@interface ZBEventDetailsViewController ()

@end

@implementation ZBEventDetailsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.eventKeys count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"eventDetailCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSString *itemKey  = [[self.eventKeys objectAtIndex:indexPath.row] description];
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"Key=%@",itemKey];
    
    NSString *itemValue  = [[self.eventValues objectAtIndex:indexPath.row] description];
    cell.detailTextLabel.text = [[NSString alloc] initWithFormat:@"Val=%@",itemValue];
    
    return cell;
}



@end
