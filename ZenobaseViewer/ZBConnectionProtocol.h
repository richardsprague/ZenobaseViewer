//
//  ZBConnectionProtocol.h
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/14/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ZBUSERNAME_KEY @"USERNAME"
#define ZBPASSWORD_KEY @"PASSWORD"
#define ZBACCESSTOKEN_KEY @"ACCESSTOKEN"
#define ZBCLIENTID_KEY @"CLIENTID"



@protocol ZBConnectionProtocol <NSObject>

// @property NSDictionary *ZBJsonReturned;
- (void)didReceiveJSON:(NSDictionary *)json;

@optional
- (id) ZBUserID;


@end
