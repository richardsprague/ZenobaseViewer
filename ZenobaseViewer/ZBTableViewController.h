//
//  ZBTableViewController.h
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/14/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBEventVC.h"
#import "ZBConnectionDelegate.h"

@interface ZBTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *buckets; // of NSDictionary


@end
