//
//  ZBViewController.m
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/10/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import "ZBViewController.h"
#import "Zenobase.h"
#import "ZBConnectionDelegate.h"


@interface ZBViewController ()<ZBConnectionProtocol>
@property (weak, nonatomic) IBOutlet UILabel *ZBClientIDLabel;
@property (weak, nonatomic) IBOutlet UITextView *ZBMainTextView;
@property (strong, nonatomic) Zenobase *myZB;
@property (weak, nonatomic) IBOutlet UILabel *ZBUsernameLabel;

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
    
    for (NSDictionary *bucket in bucketArray){
        NSLog([bucket objectForKey:@"label"]);
        self.ZBMainTextView.text = [[NSString alloc] initWithFormat:@"%@ \n%@",self.ZBMainTextView.text,[bucket objectForKey:@"label"]];
        
    }
    
    
    
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
    self.ZBMainTextView.text = @"listening";
    
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
