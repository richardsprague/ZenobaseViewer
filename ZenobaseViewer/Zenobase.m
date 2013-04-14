//
//  Zenobase.m
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/10/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import "Zenobase.h"

#define ZB_ACCESSTOKEN @"v2ehvf1802v16bo4noqf"
#define ZB_BUCKET_ID @"5fr9ofjjls"

#define ZB_URL @"https://api.zenobase.com/buckets/5fr9ofjjls/?code=v2ehvf1802v16bo4noqf" //@"https://api.zenobase.com/"

@interface Zenobase () <NSURLConnectionDelegate>
@property (strong, nonatomic) NSURLConnection *connection;
@property (strong, nonatomic) NSMutableData *receivedData;
@end

@implementation Zenobase

- (id) init
{
    self = [super init];
    
    NSURL *url = [NSURL URLWithString:ZB_URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest: request delegate:self];
    self.connection = connection;
    [connection start];
    return self;
    
}
- (id) initWithAccessToken:(NSString *)accessToken
{
    
   // NSMutableData *data = [[NSMutableData alloc] init];
    self = [super init];
    return self;

    
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *htmlSTR = [[NSString alloc] initWithData:self.receivedData encoding:NSUTF8StringEncoding];
     NSLog(@"Zenobase: %@",htmlSTR);
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:self.receivedData //1
                          
                          options:kNilOptions
                          error:&error];
    
    NSArray* latestEvents = [json objectForKey:@"events"]; //2
    self.events = latestEvents;
    
    NSDictionary* event = [latestEvents objectAtIndex:0];
    
    
    NSLog(@"events: %@", [event objectForKey:@"resource"]); //3


}


@end
