//
//  ZBEventIDTableViewer.m
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/22/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import "ZBEventIDTableViewer.h"

@interface ZBEventIDTableViewer()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ZBEventIDTableViewer

- (NSString *)titleForRow:(NSUInteger)row
{
    return [self.eventIDs[row] description]; // description because could be NSNull
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [self.eventIDs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EventID Label";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self titleForRow:indexPath.row];
    //   cell.detailTextLabel.text = [self subtitleForRow:indexPath.row];
    
    
    return cell;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
