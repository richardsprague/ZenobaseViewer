//
//  ZBConnectionProtocol.h
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/14/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZBConnectionProtocol <NSObject>

@property NSDictionary *ZBJsonReturned;
- (void)didReceiveJSON:(NSDictionary *)json;

@optional
- (id) ZBUserID;


@end
