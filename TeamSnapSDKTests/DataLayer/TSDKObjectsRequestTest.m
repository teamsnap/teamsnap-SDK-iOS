//
//  TSDKObjectRequestTest.m
//  TeamSnapSDKTests
//
//  Created by Jason Rahaim on 5/8/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TSDKObjectsRequest.h"
#import "TSDKPlan.h"
#import "TSDKShortPropertyTest.h"

@interface TSDKObjectsRequestTest : XCTestCase

@end

@interface TSDKObjectsRequest (Tests)
+ (NSArray *)supportedSDKObjects;
+ (NSArray *)dynamicSupportedObjectsList;
@end

@implementation TSDKObjectsRequestTest

- (void)testsupportedSDKObjects {
    NSMutableArray *staticListA = [NSMutableArray arrayWithArray:[TSDKObjectsRequest supportedSDKObjects]];
    
    NSMutableArray *dynamicListA = [NSMutableArray arrayWithArray:[TSDKObjectsRequest dynamicSupportedObjectsList]];
    // These two classes shouldn't be tested for. One is a test class, the other is the top level class.
    [dynamicListA removeObject:[TSDKCollectionObject class]];
    [dynamicListA removeObject:[TSDKShortPropertyTest class]];
    
    NSLog(@"%@", staticListA);
    [staticListA removeObjectsInArray:dynamicListA];
    
    XCTAssertTrue(staticListA.count == 0, @"Undefined classes in supportedSDKObjects: \n%@", staticListA);
    
    staticListA = [NSMutableArray arrayWithArray:[TSDKObjectsRequest supportedSDKObjects]];
    [dynamicListA removeObjectsInArray:staticListA];
    
    XCTAssertTrue(dynamicListA.count == 0, @"Missing classes in supportedSDKObjects: \n%@", dynamicListA);
}

@end
