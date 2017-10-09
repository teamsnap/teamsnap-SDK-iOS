//
//  TSDKCustomDatumTests.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 5/18/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TSDKCustomDatum.h"
#import "TSDKCustomField.h"
#import "NSDate+TSDKConveniences.h"

@interface TSDKCustomDatumTests : XCTestCase

@end

@implementation TSDKCustomDatumTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDataType {
    TSDKCustomDatum *newDatum = [[TSDKCustomDatum alloc] init];
    newDatum.kind = [TSDKCustomField fieldTypeStringForFieldType:TSDKCustomDataFieldTypeMenu];
    
    newDatum.value = @"Hello";
    XCTAssertEqual(newDatum.dataType, TSDKCustomDataFieldTypeMenu);
    
    newDatum.dataType = TSDKCustomDataFieldTypeDate;
    XCTAssertEqualObjects(newDatum.kind, [TSDKCustomField fieldTypeStringForFieldType:TSDKCustomDataFieldTypeDate]);
    
    newDatum.kind = @"Foo";
    XCTAssertEqual(newDatum.dataType, TSDKCustomDataFieldTypeUnknown);
    
    newDatum.dataType = TSDKCustomDataFieldTypeUnknown;
    XCTAssertEqual(newDatum.dataType, TSDKCustomDataFieldTypeText);
    XCTAssertEqualObjects(newDatum.kind, [TSDKCustomField fieldTypeStringForFieldType:TSDKCustomDataFieldTypeText]);
}

- (void)testSetDate {
    TSDKCustomDatum *newDatum = [[TSDKCustomDatum alloc] init];
    newDatum.kind = [TSDKCustomField fieldTypeStringForFieldType:TSDKCustomDataFieldTypeMenu];
    newDatum.value = @"Hello";
    
    XCTAssertNil(newDatum.dateValue);

    newDatum.value = @"1967-05-12";
    XCTAssertNil(newDatum.dateValue);
    
    newDatum.kind = [TSDKCustomField fieldTypeStringForFieldType:TSDKCustomDataFieldTypeDate];
    XCTAssertNotNil(newDatum.dateValue);
    
    NSDate *newDate = [NSDate dateWithTimeInterval:(3600*24) sinceDate:newDatum.dateValue];
    XCTAssertEqualObjects(@"1967-05-13", [newDate YYYYMMDDString]);
    
    newDatum.dateValue = newDate;
    XCTAssertEqualObjects(@"1967-05-13", newDatum.value);
}

- (void)testDisplayValue {
    TSDKCustomDatum *newDatum = [[TSDKCustomDatum alloc] init];
    newDatum.dataType = TSDKCustomDataFieldTypeDate;

    newDatum.value = @"1967-05-12";
    XCTAssertEqualObjects(@"May 12, 1967", newDatum.displayValue);
    
    NSDate *newDate = [NSDate dateWithTimeInterval:(3600*24) sinceDate:newDatum.dateValue];
    XCTAssertNotEqual(@"1967-05-13", [newDate YYYYMMDDString]);
    
    newDatum.dateValue = newDate;
    XCTAssertEqualObjects(@"May 13, 1967", newDatum.displayValue);
    
    newDatum.dataType = TSDKCustomDataFieldTypeBool;
    newDatum.value = @"1";
    
    XCTAssertEqualObjects(newDatum.displayValue, @"Yes");
}

@end
