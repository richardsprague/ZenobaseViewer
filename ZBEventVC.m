//
//  ZBEventVC.m
//  ZenobaseViewer
//
//  Created by Richard Sprague on 2/25/14.
//  Copyright (c) 2014 Richard Sprague. All rights reserved.
//

#import "ZBEventVC.h"

@interface ZBEventVC ()<ZBConnectionProtocol,UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *bucketLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdLabel;
@property (weak, nonatomic) IBOutlet UILabel *IDLabel;
// a list of events...each of which is an NSDictionary with a potentially unique set of keys and values.
@property (strong, nonatomic) NSArray *eventList;



@property (weak, nonatomic) IBOutlet UITableView *ZBEventTV;



@end

@implementation ZBEventVC

- (NSArray *) getEventList {
    if (!self.eventList){ self.eventList = [[NSMutableArray alloc]init]; }
    return self.eventList;
    
}

- (void) didReceiveJSON:(NSDictionary *)json {
  //  NSLog(@"Json:%@",json);
    NSArray *thisEvents = [json objectForKey:@"events"];
    
    
    
//    for (NSDictionary *bucketItem in json) {
//        [self.eventList addObject:bucketItem];
    
 //   }
    
    self.eventList = thisEvents;
    
//    for (NSDictionary *anEvent in thisEvents) {
//        NSLog(@"Event:");
//        NSArray *allKeys = [anEvent allKeys];
//        
//        for (NSString *key in allKeys){
//            NSLog(@"   key=%@, value = %@",key,[anEvent objectForKey:key]);
//        }}
    
        [self.ZBEventTV reloadData];
        

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [self.eventList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"eventCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSDictionary *item  = [self.eventList objectAtIndex:indexPath.row];
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"ID=%@",[item objectForKey:@"@id"]];
    
    return cell;
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
    self.bucketLabel.text = [self.bucket objectForKey:@"label"];
    self.createdLabel.text = [self.bucket objectForKey:@"created"];
    self.IDLabel.text = [self.bucket objectForKey:@"@id"];
    ZBConnectionDelegate *connection = [[ZBConnectionDelegate alloc] init    ];
    connection.delegate = self;
    
    [connection getEventsForBucket:[self.bucket objectForKey:@"@id"]];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"gotoEventDetails"]){
        
        
        ZBEventDetailsViewController *nextView = [segue destinationViewController];
//        nextView.bucketArray = self.buckets;
        
        NSUInteger row = [self.ZBEventTV indexPathForSelectedRow].row;
        nextView.eventKeys = [self.eventList[row] allKeys];
        
        nextView.eventValues = [self.eventList[row] allValues];
        
        
      //  NSLog(@"switching from Event to Event Details");
    }
    else
        NSLog(@"segue=%@",segue.identifier);
    
}

@end
