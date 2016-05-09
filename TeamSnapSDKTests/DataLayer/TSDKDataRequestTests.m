//
//  TSDKDataRequestTests.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 5/3/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TeamSnapSDK.h"

@interface TSDKDataRequestTests : XCTestCase

@end

@implementation TSDKDataRequestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRequestObjectsForPath {
    XCTestExpectation *nilLinkExpectation = [self expectationWithDescription:@"Return from nil link"];
    
    [TSDKDataRequest requestObjectsForPath:nil withConfiguration:nil completion:^(BOOL success, BOOL complete, TSDKCollectionJSON * _Nullable objects, NSError * _Nullable error) {
        if (success || complete) {
            XCTAssert(@"Returned Success on nil link");
        }
        XCTAssertNil(objects, @"Objects returned on nil array");
        [nilLinkExpectation fulfill];
    }];
    
    XCTestExpectation *countriesExpectation = [self expectationWithDescription:@"Return from /random"];

    NSURL *url = [NSURL URLWithString:@"https://api.teamsnap.com/v3/random"];
    
    [TSDKDataRequest requestObjectsForPath:url withConfiguration:[TSDKRequestConfiguration new] completion:^(BOOL success, BOOL complete, TSDKCollectionJSON * _Nullable objects, NSError * _Nullable error) {
        if (success) {
            XCTAssertNotNil(objects, @"Objects returned nil array");
        } else {
            if (!error || (error && [[error.userInfo objectForKey:TSDKTeamSnapSDKHTTPResponseCodeKey] integerValue] != 420)) {
              XCTAssert(@"Returned !Success on /random");
            } else {
                NSLog(@"Rate Limited - Not full test");
            }
        }
        [countriesExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:nil];
}

@end