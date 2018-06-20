//
//  TSDKInvoiceTests.m
//  TeamSnapSDKTests
//
//  Created by Jason Rahaim on 6/12/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TSDKCollectionJSON.h"
#import "TSDKCollectionObject.h"
#import "TSDKJSONFileResource.h"
#import "TSDKInvoice.h"

@interface TSDKInvoiceTests : XCTestCase

@end

@implementation TSDKInvoiceTests

- (void)setUp {
    [super setUp];

}

- (void)tearDown {
    [super tearDown];
}

- (void)testInvoiceInit {
    TSDKCollectionJSON *invoicesCollection = [TSDKJSONFileResource collectionFromJSONFileNamed:@"invoice"];
    
    NSArray *invoices =invoicesCollection.collection;
    TSDKInvoice *invoice = [[TSDKInvoice alloc] initWithCollection:invoices.firstObject];
    NSDecimalNumber *target = [NSDecimalNumber decimalNumberWithString:@"32.13"];

    XCTAssertEqualObjects(invoice.balance, target, @"Unexpected Balance.");

    //  3.14 can't be stored as a float.
    target = [NSDecimalNumber decimalNumberWithString:@"3.14"];
    XCTAssertEqualObjects(invoice.amountPaid, target, @"Unexpected amountPaid.");
    
    invoice.balance = target;
    XCTAssertEqualObjects(invoice.balance, target, @"Setting Balance failed.");
}

@end
