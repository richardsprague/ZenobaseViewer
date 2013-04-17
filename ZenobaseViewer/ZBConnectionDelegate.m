//
//  ZBConnectionDelegate.m
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/13/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import "ZBConnectionDelegate.h"

@interface ZBConnectionDelegate()<NSURLConnectionDelegate>

@property (strong, nonatomic) NSURLConnection *connection;
@property (strong, nonatomic) NSMutableData *receivedData;
@property (strong, nonatomic) NSString *ZBAccessTokenString;
@property (strong, nonatomic) NSString *ZBClientIDString;

@end


@implementation ZBConnectionDelegate

- (id) init {
    
    self = [super init];
    
    self.ZBAccessTokenString = [[NSString alloc] initWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"ACCESSTOKEN"]] ;
    self.ZBClientIDString = [[NSString alloc] initWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"CLIENTID"]] ;
    
    return self;
    
}

- (void) getBuckets
{
    [self.connection cancel];
    NSMutableData *data = [[NSMutableData alloc] init];
    self.receivedData = data;
    
    NSString *parameterString = [[NSString alloc] initWithFormat:@"buckets/?q=roles.principal:%@&limit=20",self.ZBClientIDString];
    
    NSString *urlString = [@"https://api.zenobase.com/" stringByAppendingString:parameterString];
    NSString *ZBBearer = [[NSString alloc] initWithFormat:@"Bearer %@",self.ZBAccessTokenString] ;
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:ZBBearer forHTTPHeaderField:@"Authorization"];
    [request setValue:@"api.zenobase.com" forHTTPHeaderField:@"Host"];
    
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest: request delegate:self];
    assert(connection);
    
    self.connection = connection;
    [connection start];
}

- (void) getEvents
{
    
}


- (void) getEventsForBucket: (NSString *) bucketIDString
{
    [self.connection cancel];
    NSMutableData *data = [[NSMutableData alloc] init];
    self.receivedData = data;
    
    
    NSString *parameterString = [[NSString alloc] initWithFormat:@"buckets/%@/?w=id:xlkj,id:myEvents,type:list",bucketIDString];
    
    NSString *urlString = [@"https://api.zenobase.com/" stringByAppendingString:parameterString];
    NSString *ZBBearer = [[NSString alloc] initWithFormat:@"Bearer %@",self.ZBAccessTokenString] ;
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:ZBBearer forHTTPHeaderField:@"Authorization"];
    [request setValue:@"api.zenobase.com" forHTTPHeaderField:@"Host"];
    
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest: request delegate:self];
    assert(connection);
    
    self.connection = connection;
    [connection start];

}

- (void) getZBAccessTokenForUsername: (NSString *) username withPassword: (NSString *)password
{

    
    [self.connection cancel];
    NSMutableData *data = [[NSMutableData alloc] init];
    self.receivedData = data;
    
    NSURL *url  = [NSURL URLWithString:@"https://api.zenobase.com/oauth/token"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];

    
    
    [request setHTTPMethod:@"POST"];

    [request setValue:@"api.zenobase.com" forHTTPHeaderField:@"Host"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSString *postData = [[NSString alloc] initWithFormat:@"grant_type=password&username=%@&password=%@",username,password];
    
      
   [request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    
        
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    self.connection = connection;
    
    [connection start];
    
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error:%@", error);
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
  //  NSLog(data.description);
    assert(data);
    [self.receivedData appendData:data];
    assert (self.receivedData);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *htmlSTR = [[NSString alloc] initWithData:self.receivedData encoding:NSUTF8StringEncoding];
   // NSLog(@"htmlstr=%@",htmlSTR);
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:self.receivedData //1
                          
                          options:kNilOptions
                          error:&error];
    
    [self.delegate didReceiveJSON:json];
    

}
@end

