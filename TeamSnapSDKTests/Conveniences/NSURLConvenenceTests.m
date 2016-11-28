//
//  NSURLConvenenceTests.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 11/2/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSURL+TSDKConveniences.h"

@interface NSURLConvenenceTests : XCTestCase

@end

@implementation NSURLConvenenceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testURLByAppendingQueryParameter {
    NSString *baseURLString = @"https://google.com/foo";
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *search1URL = [baseURL URLByAppendingQuery:@"fubar" value:nil];
    
    XCTAssertEqualObjects([search1URL absoluteString], @"https://google.com/foo?fubar");
    
    NSURL *search2URL = [search1URL URLByAppendingQuery:@"query" value:@"2"];
    XCTAssertEqualObjects([search2URL absoluteString], @"https://google.com/foo?fubar&query=2");

    
}

@end
