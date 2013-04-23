//
//  ZBEventVC.h
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/16/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBConnectionDelegate.h"

@interface ZBEventVC : UIViewController

@property (strong, nonatomic) NSString *bucketID;
@property (strong, nonatomic) NSString *eventID;

@property (nonatomic, strong) NSArray *EventIDs; 
@end
