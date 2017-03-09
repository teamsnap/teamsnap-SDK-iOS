//
//  StirngConvenienceTests.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 10/28/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+TSDKConveniences.h"

@interface StirngConvenienceTests : XCTestCase

@end

@implementation StirngConvenienceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testClassNameToUnderscoredName {
    NSString *classString1 = @"TSDKTeam";
    
    NSString *result1 = [classString1 classNameToUnderscoredName];
    XCTAssertNotNil(result1);
    XCTAssertEqualObjects(result1, @"team");
    
    NSString *classString2 = @"TSDKTeamMedium";
    NSString *result2 = [classString2 classNameToUnderscoredName];
    
    XCTAssertNotNil(result2);
    XCTAssertEqualObjects(result2, @"team_medium");
}

- (void)testAddClassNameToDescriptor {
    NSString *classString1 = @"TSDKTeam";
    NSString *methodString1 = @"description";
    NSString *result1 = [methodString1 addClassNameToDescriptor:classString1];
    
    XCTAssertNotNil(result1);
    XCTAssertEqualObjects(result1, @"team_description");
    
    NSString *classString2 = @"TSDKTeamMedium";
    NSString *methodString2 = @"description";
    NSString *result2 = [methodString2 addClassNameToDescriptor:classString2];
    
    XCTAssertNotNil(result2);
    XCTAssertEqualObjects(result2, @"team_medium_description");
}

- (void)testStripClassNameFromDescriptor {
    NSString *classString1 = @"TSDKTeam";
    NSString *methodString1 = @"team_description";
    NSString *result1 = [methodString1 stripClassNameFromDescriptor:classString1];
    
    XCTAssertNotNil(result1);
    XCTAssertEqualObjects(result1, @"description");
    
    NSString *classString2 = @"TSDKTeamMedium";
    NSString *methodString2 = @"team_medium_description";
    NSString *result2 = [methodString2 stripClassNameFromDescriptor:classString2];
    
    XCTAssertNotNil(result2);
    XCTAssertEqualObjects(result2, @"description");
}

@end
