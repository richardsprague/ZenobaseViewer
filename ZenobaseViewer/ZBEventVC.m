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
 //   NSLog(json.description);
    NSDictionary *jsonevents = [json objectForKey:@"myEvents"];
    NSString *jsonTotal = [json objectForKey:@"total"];
    NSLog(@"found %@ events",jsonTotal);
    
    NSMutableArray *eventArray = [[NSMutableArray alloc] init];
    for (NSDictionary *event in jsonevents ){
        [eventArray addObject:event];
    }
    // NSLog(eventArray.description);
    NSMutableArray *eventsTemp = [[NSMutableArray alloc] init];
    
    for (NSDictionary *event in eventArray){
        //   NSLog([event objectForKey:@"label"]);
        NSString *eventItem = [event objectForKey:@"@id"];
        if (eventItem) { [eventsTemp addObject:eventItem];
             NSLog(@"eventItem = %@",eventItem.description);
        }
        self.eventIDs = eventsTemp;
        
   //     self.ZBMainTextView.text = [[NSString alloc] initWithFormat:@"<%@ %@>",self.ZBMainTextView.text,[event objectForKey:@"label"]];
       
    }
    
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
