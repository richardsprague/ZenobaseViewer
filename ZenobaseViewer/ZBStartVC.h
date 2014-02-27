//
//  ZBStartVC.h
//  ZenobaseViewer
//
//  Created by Richard Sprague on 2/25/14.
//  Copyright (c) 2014 Richard Sprague. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBConnectionDelegate.h"
#import "ZBBucketTVC.h"

@interface ZBStartVC : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *addBucketField;
- (IBAction) finishAddBucket:(id)sender;
@end
