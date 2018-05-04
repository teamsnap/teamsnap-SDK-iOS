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
@property (strong, nonatomic) NSURL *baseURL;

@end

@implementation NSURLConvenenceTests

- (void)setUp {
    [super setUp];
    NSString *baseURLString = @"https://google.com/foo";
    _baseURL = [NSURL URLWithString:baseURLString];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testURLByAppendingQueryParameter {

    NSURL *search1URL = [self.baseURL URLByAppendingQuery:@"fubar" value:nil];
    
    XCTAssertEqualObjects([search1URL absoluteString], @"https://google.com/foo?fubar");
    
    NSURL *search2URL = [search1URL URLByAppendingQuery:@"query" value:@"2"];
    XCTAssertEqualObjects([search2URL absoluteString], @"https://google.com/foo?fubar&query=2");

    search2URL = [search2URL URLByAppendingQuery:@"Foo" value:@"bar"];
    XCTAssertEqualObjects([search2URL absoluteString], @"https://google.com/foo?fubar&query=2&Foo=bar");
    
    NSURL *searchNilURL = nil;
    [searchNilURL URLByAppendingQuery:@"Foo" value:@"Bar"];
    // Just checking to to make sure it doesn't crash.
}

- (void)testURLByAppendingQueryitem {
    NSURL *search1URL = [self.baseURL URLByAppendingQuery:@"fubar" value:nil];

    NSURLQueryItem *queryItem1 = [[NSURLQueryItem alloc] initWithName:@"ScoreFor" value:@"7"];
    NSURL *resultURL1 = [search1URL URLByAppendingQueryItem:queryItem1];
    
    XCTAssertEqualObjects([resultURL1 absoluteString], @"https://google.com/foo?fubar&ScoreFor=7");

    NSURL *resultURL2 = [resultURL1  URLByAppendingQueryItem:[[NSURLQueryItem alloc] initWithName:@"ScoreAgainst" value:@"0"]];
    XCTAssertEqualObjects([resultURL2 absoluteString], @"https://google.com/foo?fubar&ScoreFor=7&ScoreAgainst=0");
    
    NSURL *resultURL3 = [self.baseURL URLByAppendingQueryItem:nil];
    XCTAssertEqualObjects([resultURL3 absoluteString], @"https://google.com/foo");
}

- (void)testURLByAppendingArrayOfQueryitems {
    NSURLQueryItem *queryItem1 = [[NSURLQueryItem alloc] initWithName:@"ScoreFor" value:@"7"];
    NSURLQueryItem *queryItem2 = [[NSURLQueryItem alloc] initWithName:@"ScoreAgainst" value:@"0"];
    
    NSURL *resultURL1 = [self.baseURL URLByAppendingArrayOfQueryItems:@[queryItem1, queryItem2]];
    XCTAssertEqualObjects([resultURL1 absoluteString], @"https://google.com/foo?ScoreFor=7&ScoreAgainst=0");
    
}

@end
