//
//  ZBBucketViewController.m
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/15/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import "ZBBucketViewController.h"

@interface ZBBucketViewController ()

@end

@implementation ZBBucketViewController

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
    NSMutableArray *bucketsTemp = [[NSMutableArray alloc] init];
    
    if (!self.buckets){
    
    for (int i=0;i<5;i++)
    {
        NSString *thisBucket = [[NSString alloc] initWithFormat:@"Bucket %d",i];
        
        NSDictionary *bucket = [[NSDictionary alloc] initWithObjectsAndKeys:thisBucket ,@"label", nil];
        [bucketsTemp addObject:bucket];
    //    NSLog(bucket.description);
        
    }
    
    
    self.buckets = bucketsTemp;
    }
    
    // self.buckets is an array of dictionary items, each of which has a set of values and keys including one key "label" with a value of the name of the bucket.
    
  
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
