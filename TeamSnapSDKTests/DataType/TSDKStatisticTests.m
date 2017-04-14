//
//  TSDKStatisticTests.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 3/17/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TSDKStatistic.h"

@interface TSDKStatisticTests : XCTestCase

@end

@implementation TSDKStatisticTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDisplayStringForStatisticValue {
    TSDKStatistic *statistic = [[TSDKStatistic alloc] init];
    statistic.position = 1;
    statistic.alwaysDisplayDecimals = NO;
    statistic.precision = 0;
    statistic.acronym = @"H";
    statistic.formula = @"1B+2B+3B+HR";
    statistic.prettyFormula = @"Singles+Doubles+Triples+Home Runs";
    statistic.isTopStatistic = YES;
    statistic.displayZeroTotals = NO;

    NSNumber *total = @1;
    NSString *displayString = [statistic displayStringForStatisticValue:total];
    XCTAssertEqualObjects(displayString, @"1");
    
    total = [NSNumber numberWithFloat:1.0f];
    displayString = [statistic displayStringForStatisticValue:total];
    XCTAssertEqualObjects(displayString, @"1");

    
    total = [NSNumber numberWithFloat:1.01f];
    displayString = [statistic displayStringForStatisticValue:total];
    XCTAssertEqualObjects(displayString, @"1");
    
    statistic.precision = 1;
    displayString = [statistic displayStringForStatisticValue:total];
    XCTAssertEqualObjects(displayString, @"1.0");
    
    statistic.precision = 2;
    displayString = [statistic displayStringForStatisticValue:total];
    XCTAssertEqualObjects(displayString, @"1.01");
    
    total = [NSNumber numberWithFloat:1.0f];
    statistic.precision = 1;
    statistic.alwaysDisplayDecimals = NO;
    displayString = [statistic displayStringForStatisticValue:total];
    XCTAssertEqualObjects(displayString, @"1");

    statistic.alwaysDisplayDecimals = YES;
    displayString = [statistic displayStringForStatisticValue:total];
    XCTAssertEqualObjects(displayString, @"1.0");

}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
