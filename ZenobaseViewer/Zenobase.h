//
//  Zenobase.h
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/10/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Zenobase : NSObject

@property (strong,nonatomic) NSArray *events;
@property (strong, nonatomic) NSArray *buckets;
@property (strong, nonatomic) NSString *accessToken;

- (id) initWithAccessToken: (NSString *) accessToken;

@end
