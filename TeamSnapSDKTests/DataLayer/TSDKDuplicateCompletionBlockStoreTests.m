//
//  TSDKDuplicateCompletionBlockStoreTests.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 8/31/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TSDKDuplicateCompletionBlockStore.h"

@interface TSDKDuplicateCompletionBlockStoreTests : XCTestCase

@end

@implementation TSDKDuplicateCompletionBlockStoreTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExistingRequestExistsMatchingRequest {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    BOOL existing = [[TSDKDuplicateCompletionBlockStore sharedInstance] existingRequestExistsMatchingRequest:nil];
#pragma clang diagnostic pop
    
    XCTAssertFalse(existing, @"existing request found for nil");
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://google.com/"]];
    
    existing = [[TSDKDuplicateCompletionBlockStore sharedInstance] existingRequestExistsMatchingRequest:request];
    XCTAssertFalse(existing, @"existing request found for new request");
    
    [[TSDKDuplicateCompletionBlockStore sharedInstance] addCompletionBlock:^(BOOL success, BOOL complete, id  _Nullable objects, NSError * _Nullable error) {
        XCTFail(@"Should not be called");
    } forRequest:request];
    
    existing = [[TSDKDuplicateCompletionBlockStore sharedInstance] existingRequestExistsMatchingRequest:request];
    XCTAssertTrue(existing, @"existing request not found for duplicate request");
    
    NSURLRequest *request2 = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://google.com/"]];

    existing = [[TSDKDuplicateCompletionBlockStore sharedInstance] existingRequestExistsMatchingRequest:request2];
    XCTAssertTrue(existing, @"existing request not found for duplicate request");
    
    [[TSDKDuplicateCompletionBlockStore sharedInstance] removeAllCompletionBlocksForRequest:request];
}

- (void)testAddCompletionBlock {
    // these tests only cover passing nil completeion blocks, and requests.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    [[TSDKDuplicateCompletionBlockStore sharedInstance] addCompletionBlock:nil forRequest:nil];
    
    [[TSDKDuplicateCompletionBlockStore sharedInstance] addCompletionBlock:^(BOOL success, BOOL complete, id  _Nullable objects, NSError * _Nullable error) {
        XCTFail(@"Shouldn't be called");
    } forRequest:nil];
#pragma clang diagnostic pop
}

- (void)testRemoveAllCompletionBlocksForRequest {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    [[TSDKDuplicateCompletionBlockStore sharedInstance] removeAllCompletionBlocksForRequest:nil];
#pragma clang diagnostic pop
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://google.com/"]];
    
    [[TSDKDuplicateCompletionBlockStore sharedInstance] addCompletionBlock:^(BOOL success, BOOL complete, id  _Nullable objects, NSError * _Nullable error) {
        XCTFail(@"Should not be called");
    } forRequest:request];

    BOOL existing = [[TSDKDuplicateCompletionBlockStore sharedInstance] existingRequestExistsMatchingRequest:request];

    XCTAssertTrue(existing, @"Existing completion block not found");
    
    [[TSDKDuplicateCompletionBlockStore sharedInstance] removeAllCompletionBlocksForRequest:request];
    
    existing = [[TSDKDuplicateCompletionBlockStore sharedInstance] existingRequestExistsMatchingRequest:request];
    XCTAssertFalse(existing, @"Existing completion block found after remove all.");
}

- (void)testCompletionBlocksForRequest {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    NSSet *set = [[TSDKDuplicateCompletionBlockStore sharedInstance] completionBlocksForRequest:nil];
#pragma clang diagnostic pop
    
    XCTAssertNotNil(set, @"Nil set returned for nil request");
    
    XCTAssertTrue(set.count==0, @"Non empty set returned for completion blocks for nil request");
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://google.com/"]];
    
    [[TSDKDuplicateCompletionBlockStore sharedInstance] addCompletionBlock:^(BOOL success, BOOL complete, id  _Nullable objects, NSError * _Nullable error) {
        XCTFail(@"Should not be called");
    } forRequest:request];
    
    set = [[TSDKDuplicateCompletionBlockStore sharedInstance] completionBlocksForRequest:request];
    XCTAssertNotNil(set, @"Nil set returned for valid request");
    
    XCTAssertTrue(set.count==1, @"Incorrect set count returned for completion blocks for valid request");
    [[TSDKDuplicateCompletionBlockStore sharedInstance] addCompletionBlock:^(BOOL success, BOOL complete, id  _Nullable objects, NSError * _Nullable error) {
        XCTFail(@"Should not be called 2");
    } forRequest:request];
    
    set = [[TSDKDuplicateCompletionBlockStore sharedInstance] completionBlocksForRequest:request];
    XCTAssertNotNil(set, @"Nil set returned for valid request");
    
    XCTAssertTrue(set.count==2, @"Incorrect set count returned for completion blocks for valid request");
    
    [[TSDKDuplicateCompletionBlockStore sharedInstance] removeAllCompletionBlocksForRequest:request];    
}

@end
