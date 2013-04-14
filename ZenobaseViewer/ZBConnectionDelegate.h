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

@end

@protocol ZBConnectionDelegate <NSObject>
@optional
- (id) ZBUserID;

@end
