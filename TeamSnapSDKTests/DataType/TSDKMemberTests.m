//
//  TSDKMemberTests.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 5/20/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TSDKMember.h"

@interface TSDKMemberTests : XCTestCase

@end

@implementation TSDKMemberTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddressString {
    TSDKMember *member = [[TSDKMember alloc] init];
    XCTAssertNotEqual(@"", member.addressString);
    XCTAssertNotEqual(@"", member.fancyAddressString);
    
    member.addressStreet1 = @"101 Main Street";
    XCTAssertEqualObjects(@"101 Main Street", member.addressString);
    XCTAssertEqualObjects(@"101 Main Street", member.fancyAddressString);
    
    member.addressStreet2 = @"Suite 100";
    XCTAssertEqualObjects(@"101 Main Street, Suite 100", member.addressString);
    XCTAssertEqualObjects(@"101 Main Street\nSuite 100", member.fancyAddressString);
    
    member.addressCity = @"Boulder";
    XCTAssertEqualObjects(@"101 Main Street, Suite 100, Boulder", member.addressString);
    XCTAssertEqualObjects(@"101 Main Street\nSuite 100\nBoulder", member.fancyAddressString);
    
    member.addressState = @"CO";
    XCTAssertEqualObjects(@"101 Main Street, Suite 100, Boulder, CO", member.addressString);
    XCTAssertEqualObjects(@"101 Main Street\nSuite 100\nBoulder, CO", member.fancyAddressString);
    
    member.addressZip = @"27526";
    XCTAssertEqualObjects(@"101 Main Street, Suite 100, Boulder, CO 27526", member.addressString);
    XCTAssertEqualObjects(@"101 Main Street\nSuite 100\nBoulder, CO 27526", member.fancyAddressString);
    
    member.addressStreet2 = nil;
    XCTAssertEqualObjects(@"101 Main Street, Boulder, CO 27526", member.addressString);
    XCTAssertEqualObjects(@"101 Main Street\nBoulder, CO 27526", member.fancyAddressString);
    
    member.addressState = nil;
    XCTAssertEqualObjects(@"101 Main Street, Boulder 27526", member.addressString);
    XCTAssertEqualObjects(@"101 Main Street\nBoulder, 27526", member.fancyAddressString);
    
}
@end
