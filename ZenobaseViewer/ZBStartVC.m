//
//  ZBStartVC.m
//  ZenobaseViewer
//
//  Created by Richard Sprague on 2/25/14.
//  Copyright (c) 2014 Richard Sprague. All rights reserved.
//

#import "ZBStartVC.h"

@interface ZBStartVC ()<ZBConnectionProtocol>
@property (weak, nonatomic) IBOutlet UILabel *ZBClientIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *ZBUsernameLabel;
@property (strong, nonatomic) NSMutableArray *buckets;
@end

@implementation ZBStartVC


- (IBAction)browseBucketsClicked:(id)sender {
    
    NSLog(@"browse buckets clicked");
    
}

- (void) didReceiveJSON:(NSDictionary *)json
{
    
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
         NSLog(@"bucket=%@",[bucket objectForKey:@"label"]);
        [bucketsTemp addObject:[bucket objectForKey:@"label"]];

        
    }
    
    //bucketArray is an array of the dictionary objects I want to pass to the UITableViewController.
    //ZBBucketViewController *nextVC = [[ZBBucketViewController alloc] init];
    
    self.buckets = bucketArray;
    
    
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
    
    self.ZBUsernameLabel.text = [[NSString alloc] initWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] stringForKey:ZBUSERNAME_KEY]];
    
    if ([[NSUserDefaults standardUserDefaults] stringForKey:ZBCLIENTID_KEY]){
        self.ZBClientIDLabel.text = [[NSString alloc] initWithString:[[NSUserDefaults standardUserDefaults] stringForKey:ZBCLIENTID_KEY] ];
    
    }
    
    ZBConnectionDelegate *connection = [[ZBConnectionDelegate alloc] init    ];
    connection.delegate = self;
    
    [connection getBuckets];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender  {
    if ([segue.identifier isEqualToString:@"gotoBucketView"]){
        
        
        ZBBucketTVC *nextView = [segue destinationViewController];
        nextView.bucketArray = self.buckets;
        

        
        NSLog(@"switching from start to bucketView");
    }
    else
        NSLog(@"segue=%@",segue.identifier);
    
}
    
    

@end
