//
//  ZBConnectionDelegate.h
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/13/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZBConnectionProtocol.h"


@interface ZBConnectionDelegate : NSObject

- (void) getZBAccessTokenForUsername: (NSString *) username withPassword: (NSString *)password;
- (void) getBuckets;

@property (strong, nonatomic) id <ZBConnectionProtocol>delegate;

@property (strong, nonatomic) NSString *ZBAccessToken;

@end
