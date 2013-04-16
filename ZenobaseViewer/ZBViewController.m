//
//  ZBViewController.m
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/10/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import "ZBViewController.h"
#import "Zenobase.h"
#import "ZBBucketViewController.h"
#import "ZBConnectionDelegate.h"


@interface ZBViewController ()<ZBConnectionProtocol>
@property (weak, nonatomic) IBOutlet UILabel *ZBClientIDLabel;
@property (weak, nonatomic) IBOutlet UITextView *ZBMainTextView;
@property (strong, nonatomic) Zenobase *myZB;
@property (weak, nonatomic) IBOutlet UILabel *ZBUsernameLabel;
@property (strong, nonatomic) NSArray *buckets;

@end

@implementation ZBViewController

- (void)didReceiveJSON:(NSDictionary*)json
{
    self.ZBMainTextView.text = nil;
    NSDictionary *jsonBuckets = [json objectForKey:@"buckets"];
    NSString *jsonTotal = [json objectForKey:@"total"];
    NSLog(@"found %@ buckets",jsonTotal);
    
    NSMutableArray *bucketArray = [[NSMutableArray alloc] init];
    for (NSDictionary *bucket in jsonBuckets ){
        [bucketArray addObject:bucket];
    }
   // NSLog(bucketArray.description);
        NSMutableArray *bucketsTemp = [[NSMutableArray alloc] init];
    
    for (NSDictionary *bucket in bucketArray){
        NSLog([bucket objectForKey:@"label"]);
        [bucketsTemp addObject:[bucket objectForKey:@"label"]];
        self.ZBMainTextView.text = [[NSString alloc] initWithFormat:@"%@><%@",self.ZBMainTextView.text,[bucket objectForKey:@"label"]];
        
    }
    
    //bucketArray is an array of the dictionary objects I want to pass to the UITableViewController.
    //ZBBucketViewController *nextVC = [[ZBBucketViewController alloc] init];
    
    self.buckets = bucketArray;
    
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ZBBucketViewController *nextView = [segue destinationViewController];
    
    if (self.buckets){
    nextView.buckets = self.buckets;
    } else NSLog(@"waiting for buckets");
    
    //  nextView.scene = [[STScene alloc] init];
    // nextView.delegate = self;
    
}

// getter for Zenobase *myZB
- (Zenobase *) myZB
{
    if (!_myZB)
    {
        _myZB = [[Zenobase alloc] init];
        
    }
    return self.myZB;
}

- (IBAction)ZBListBucketsClicked:(UIButton *)sender {
    self.ZBMainTextView.text = @"Getting list of buckets...";
    
    ZBConnectionDelegate *newConnection = [[ZBConnectionDelegate alloc] init];
    newConnection.delegate = self;
    [newConnection getBuckets];
    
}

- (IBAction)ZBListEventsClicked:(UIButton *)sender {
    self.ZBMainTextView.text = @"<no events>";
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:(BOOL)animated];
	// Do any additional setup after loading the view, typically from a nib.
    self.ZBUsernameLabel.text = [[NSString alloc] initWithFormat:@"For user: %@",[[NSUserDefaults standardUserDefaults] stringForKey:ZBUSERNAME_KEY]];
    
    if ([[NSUserDefaults standardUserDefaults] stringForKey:ZBCLIENTID_KEY]){
        self.ZBClientIDLabel.text = [[NSString alloc] initWithString:[[NSUserDefaults standardUserDefaults] stringForKey:ZBCLIENTID_KEY] ];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
