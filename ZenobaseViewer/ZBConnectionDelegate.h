//
//  ZBConnectionDelegate.h
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/13/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ZBConnectionDelegate;

@interface ZBConnectionDelegate : NSObject

- (void) getZBAccessTokenForUsername: (NSString *) username withPassword: (NSString *)password;

@property (strong, nonatomic) NSString *ZBAccessToken;

@end

@protocol ZBConnectionDelegate <NSObject>
@optional
- (id) ZBUserID;

@end
