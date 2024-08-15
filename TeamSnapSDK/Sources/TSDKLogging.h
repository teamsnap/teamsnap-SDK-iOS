//
//  TSDKLogging.h
//  TeamSnapSDK
//
//  Created by Marquez Gallegos on 9/29/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#ifndef TSDKLogging_h
#define TSDKLogging_h

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#endif /* TSDKLogging_h */
