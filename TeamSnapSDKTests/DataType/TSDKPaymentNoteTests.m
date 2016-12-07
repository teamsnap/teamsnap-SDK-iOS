//
//  TSDKPaymentNoteTests.m
//  TeamSnapSDK
//
//  Created by Marquez Gallegos on 12/6/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TSDKJSONFileResource.h"
#import "TSDKPaymentNote.h"

@interface TSDKPaymentNoteTests : XCTestCase

@end

@implementation TSDKPaymentNoteTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    TSDKCollectionJSON *paymentNotesCollection = [TSDKJSONFileResource collectionFromJSONFileNamed:@"PaymentNotes"];
    NSArray *paymentNotes = paymentNotesCollection.collection;
    TSDKPaymentNote *note = [[TSDKPaymentNote alloc] initWithCollection:paymentNotes.firstObject];
    
    XCTAssertTrue([note.paymentNoteDescription isEqualToString:@"$450.00 USD payment attempted via batch payment to Paypal."], @"Expected a valid payment note");
    
    note.paymentNoteDescription = @"Some other note.";
    XCTAssertTrue([note.paymentNoteDescription isEqualToString:@"Some other note."], @"Failed to set paymentNoteDescription");
}

@end
