//
//  NSHTTPURLResponse+convenience.h
//  SDKPlayground
//
//  Created by Jason Rahaim on 1/9/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSHTTPURLResponse (convenience)

- (BOOL)wasSuccess;
- (BOOL)completed;

@end
