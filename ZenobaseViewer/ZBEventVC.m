//
//  ZBEventVC.m
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/16/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import "ZBEventVC.h"


@interface ZBEventVC ()<ZBConnectionProtocol>

@end

@implementation ZBEventVC

- (void) didReceiveJSON:(NSDictionary *)json
{
    NSLog(@"received something...");
    NSLog(json.description);
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    ZBConnectionDelegate *newConnection = [[ZBConnectionDelegate alloc] init];
    newConnection.delegate = self;
    [newConnection getEventsForBucket:self.bucketID];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
