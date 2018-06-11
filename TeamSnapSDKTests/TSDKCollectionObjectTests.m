//
//  TSDKCollectionObject.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 3/7/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TSDKCollectionJSON.h"
#import "TSDKCollectionObject.h"
#import "TSDKUser.h"
#import "TSDKEvent.h"
#import "TSDKMemberPayment.h"
#import "NSDictionary+dump.h"
#import "TSDKJSONFileResource.h"
#import "TSDKShortPropertyTest.h"

@interface TSDKCollectionObjectTests : XCTestCase
@property (nonatomic, strong) TSDKCollectionJSON *userCollectionJSON;
@end

@implementation TSDKCollectionObjectTests

- (void)setUp {
    [super setUp];
    NSString *jsonString = @"{\"collection\":{\"version\":\"3.177.2\",\"href\":\"https://api.teamsnap.com/v3/users\",\"rel\":\"users\",\"template\":{\"data\":[{\"name\":\"first_name\",\"value\":null},{\"name\":\"last_name\",\"value\":null},{\"name\":\"password\",\"value\":null},{\"name\":\"birthday\",\"value\":null},{\"name\":\"email\",\"value\":null},{\"name\":\"facebook_id\",\"value\":null},{\"name\":\"facebook_access_token\",\"value\":null},{\"name\":\"type\",\"value\":\"user\"}]},\"links\":[{\"rel\":\"members\",\"href\":\"https://api.teamsnap.com/v3/members\"},{\"rel\":\"teams\",\"href\":\"https://api.teamsnap.com/v3/teams\"},{\"rel\":\"teams_preferences\",\"href\":\"https://api.teamsnap.com/v3/teams_preferences\"},{\"rel\":\"root\",\"href\":\"https://api.teamsnap.com/v3/\"},{\"rel\":\"self\",\"href\":\"https://api.teamsnap.com/v3/me\"}],\"queries\":[{\"rel\":\"search\",\"href\":\"https://api.teamsnap.com/v3/users/search\",\"data\":[{\"name\":\"id\",\"value\":null}]}],\"items\":[{\"href\":\"https://api.teamsnap.com/v3/users/2\",\"data\":[{\"name\":\"id\",\"value\":2},{\"name\":\"type\",\"value\":\"user\"},{\"name\":\"address_country\",\"value\":null},{\"name\":\"address_state\",\"value\":null},{\"name\":\"birthday\",\"value\":\"1970-05-01\"},{\"name\":\"email\",\"value\":\"manager@example.com\"},{\"name\":\"facebook_access_token\",\"value\":null},{\"name\":\"facebook_id\",\"value\":null},{\"name\":\"first_name\",\"value\":\"Tester\"},{\"name\":\"is_eligible_for_free_trial\",\"value\":false},{\"name\":\"last_name\",\"value\":\"Joe\"},{\"name\":\"receives_newsletter\",\"value\":false},{\"name\":\"teams_count\",\"value\":2},{\"name\":\"created_at\",\"value\":\"2015-08-12T22:17:13Z\",\"type\":\"DateTime\"},{\"name\":\"updated_at\",\"value\":\"2016-01-20T19:15:28Z\",\"type\":\"DateTime\"}],\"links\":[{\"rel\":\"active_teams\",\"href\":\"https://api.teamsnap.com/v3/teams/active?user_id=2\"},{\"rel\":\"members\",\"href\":\"https://api.teamsnap.com/v3/members/search?user_id=2\"},{\"rel\":\"teams\",\"href\":\"https://api.teamsnap.com/v3/teams/search?user_id=2\"},{\"rel\":\"personas\",\"href\":\"https://api.teamsnap.com/v3/members/personas?user_id=2\"},{\"rel\":\"teams_preferences\",\"href\":\"https://api.teamsnap.com/v3/teams_preferences/search?user_id=2\"},{\"rel\":\"facebook_pages\",\"href\":\"https://api.teamsnap.com/v3/facebook_pages/search\"}],\"rel\":\"user-2\"}]}}";
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    _userCollectionJSON = [[TSDKCollectionJSON alloc] initWithJSON:JSON];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitWithCollection {
    if ([_userCollectionJSON.collection isKindOfClass:[NSArray class]] ) {
        TSDKCollectionJSON *subCollection = [(NSArray *)_userCollectionJSON.collection firstObject];
        
        TSDKUser *user= [[TSDKUser alloc] initWithCollection:subCollection];
        XCTAssertEqualObjects(user.firstName, @"Tester");
        XCTAssertNil(user.addressCountry);
        XCTAssertEqualObjects(user.objectIdentifier, @"2");
    } else {
        XCTAssert(@"Collection JSON parsing failed");
    }
}

- (void)testObjectIdentifiers {
    TSDKCollectionJSON *memberPaymentsCollection = [TSDKJSONFileResource collectionFromJSONFileNamed:@"MemberPayments"];
    NSArray *memberPayments = memberPaymentsCollection.collection;
    TSDKMemberPayment *paymentNoPayment = [[TSDKMemberPayment alloc] initWithCollection:memberPayments.firstObject];
    XCTAssertEqualObjects(paymentNoPayment.teamId, @"949008");
    paymentNoPayment.teamId = nil;
    XCTAssertNotEqualObjects(paymentNoPayment.teamId, @"949008");
    XCTAssertNil(paymentNoPayment.teamId);
    XCTAssertNotEqualObjects(paymentNoPayment.teamId, @"");
    
    [paymentNoPayment undoChanges];
    XCTAssertEqualObjects(paymentNoPayment.teamId, @"949008");

    [paymentNoPayment removeCollectionObjectForKey:@"team_id"];
    XCTAssertNotEqualObjects(paymentNoPayment.teamId, @"");
    XCTAssertNil(paymentNoPayment.teamId);
    
    XCTAssertEqualObjects(paymentNoPayment.objectIdentifier, @"19069782");
    XCTAssertFalse(paymentNoPayment.isNewObject);
    
    TSDKMemberPayment *newPayment = [[TSDKMemberPayment alloc] init];
    XCTAssertTrue(newPayment.isNewObject);
    XCTAssertEqualObjects(newPayment.objectIdentifier, @"");
    
    TSDKShortPropertyTest *shortProperty = [[TSDKShortPropertyTest alloc] init];
    shortProperty.a = @"a"; // test setter
    NSString *a = shortProperty.a;  // test getter
    XCTAssertEqual(shortProperty.a, a);
}

- (void)testObjectFromObject {
    if ([_userCollectionJSON.collection isKindOfClass:[NSArray class]] ) {
        TSDKCollectionJSON *subCollection = [(NSArray *)_userCollectionJSON.collection firstObject];
        
        TSDKUser *user= [[TSDKUser alloc] initWithCollection:subCollection];
        
        TSDKUser *newUser = [TSDKUser objectWithObject:user];
        XCTAssertNotNil(newUser);
        XCTAssertTrue(newUser.isNewObject);
        XCTAssertNil([newUser collectionObjectForKey:@"team_id"]);
        XCTAssertEqualObjects(newUser.lastName, @"Joe");
        NSString *objectClassName = NSStringFromClass([newUser class]);
        XCTAssertEqualObjects(objectClassName, @"TSDKUser");
    } else {
        XCTAssert(@"Collection JSON parsing failed");
    }
}

- (void)testSetObjectForValue {
    if ([_userCollectionJSON.collection isKindOfClass:[NSArray class]] ) {
        TSDKCollectionJSON *subCollection = [(NSArray *)_userCollectionJSON.collection firstObject];
        
        TSDKUser *user= [[TSDKUser alloc] initWithCollection:subCollection];
        user.firstName = @"First";
        
        XCTAssertEqualObjects(user.firstName, @"First");
        XCTAssertEqualObjects([[user changedValues] valueForKey:@"first_name"] , @"Tester");
        user.lastName = nil;
        XCTAssertEqualObjects([user collectionObjectForKey:@"last_name"], [NSNull null]);
        XCTAssertNil(user.lastName);
        XCTAssertEqualObjects([[user changedValues] valueForKey:@"last_name"], @"Joe");
        
        [user undoChanges];
        XCTAssertEqualObjects(user.firstName, @"Tester");
        XCTAssertEqualObjects(user.lastName, @"Joe");
        
    }  else {
        XCTAssert(@"Collection JSON parsing failed");
    }
}

- (void)testDataToSave {
    if ([_userCollectionJSON.collection isKindOfClass:[NSArray class]] ) {
        TSDKCollectionJSON *subCollection = [(NSArray *)_userCollectionJSON.collection firstObject];
        
        TSDKUser *user= [[TSDKUser alloc] initWithCollection:subCollection];
        user.firstName = @"First";
        user.lastName = nil;
        NSDictionary *dataToSave = [user dataToSave];
        NSDictionary *expectedDataToSave = @{@"data":@[@{@"name":@"first_name",@"value":@"First"},@{@"name":@"last_name",@"value":[NSNull null]}]};
        XCTAssertEqualObjects(dataToSave, expectedDataToSave);
    } else {
        XCTAssert(@"Collection JSON parsing failed");
    }
}

- (void)testSettingObjectToSameValue {
    TSDKEvent *event = [[TSDKEvent alloc] init];
    NSString *testValue = @"test event";
    event.name = testValue;
    XCTAssertEqual(event.name, testValue);
    XCTAssertEqual([event.changedValues objectForKey:@"name"], [NSNull null]);
    [event clearChanges];
    
    event.name = testValue;
    XCTAssertEqual(event.name, testValue);
    XCTAssertNil([event.changedValues objectForKey:@"name"]);

    NSString *newValue = @"New event Name";

    event.name = newValue;
    XCTAssertEqual(event.name, newValue);
    XCTAssertNotNil([event.changedValues objectForKey:@"name"]);
    XCTAssertEqual([event.changedValues objectForKey:@"name"], testValue);
    
    [event undoChanges];
    XCTAssertNil([event.changedValues objectForKey:@"name"]);
    
    TSDKCollectionJSON *subCollection = [(NSArray *)_userCollectionJSON.collection firstObject];
    TSDKUser *user= [[TSDKUser alloc] initWithCollection:subCollection];
    
    NSDate *birthDate = [user.birthday copy];
    user.birthday = birthDate;
    XCTAssertTrue((user.changedValues.count == 0));
    
    user.birthday = [NSDate date];
    XCTAssertNotNil([user.changedValues objectForKey:@"birthday"]);
    
    [user undoChanges];
    XCTAssertTrue([user.birthday isEqualToDate:birthDate]);
}

- (void)testSettingAndReadingDates {
    TSDKEvent *event = [[TSDKEvent alloc] init];
    NSDate *referenceDate = [NSDate dateWithTimeIntervalSince1970:1461074742.0];
    [event setStartDate:referenceDate];
    XCTAssertNotNil(event.startDate);
    
    XCTAssertEqualObjects(event.startDate, referenceDate);
    
    event.startDate = [NSDate dateWithTimeIntervalSince1970:1461074842.0];
    XCTAssertNotEqualObjects(event.startDate, referenceDate);
    
    referenceDate = [referenceDate dateByAddingTimeInterval:100];
    XCTAssertEqualObjects(event.startDate, referenceDate);
    
    event.endDate = nil;
    XCTAssertNil(event.endDate);
    
    XCTAssertNotNil(event.startDate);
    
    event.startDate = nil;
    XCTAssertNil(event.startDate);
    
    // testing when JSON date string == ""
    if ([_userCollectionJSON.collection isKindOfClass:[NSArray class]] ) {
        TSDKCollectionJSON *subCollection = [(NSArray *)_userCollectionJSON.collection firstObject];
        
        TSDKUser *user= [[TSDKUser alloc] initWithCollection:subCollection];
        [user setString:@"" forKey:@"created_at"];
        XCTAssertNoThrow(user.createdAt);
    }
    
    [event setString:@"8-13" forKey:@"start_date"];
    XCTAssertNoThrow(event.startDate);
}

- (void)testArrayFromLinkWithNilLink {
    if ([_userCollectionJSON.collection isKindOfClass:[NSArray class]] ) {
        TSDKCollectionJSON *subCollection = [(NSArray *)_userCollectionJSON.collection firstObject];
        
        TSDKUser *user= [[TSDKUser alloc] initWithCollection:subCollection];
        
        XCTestExpectation *userExpectation = [self expectationWithDescription:@"Return from /random"];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        [user arrayFromLink:nil withConfiguration:nil completion:^(BOOL success, BOOL complete, NSArray * _Nullable objects, NSError * _Nullable error) {
            if (success || complete) {
                XCTAssert(@"Returned Success on nil link");
            }
            XCTAssertTrue(objects.count==0, @"Objects returned on nil array");
            [userExpectation fulfill];
        }];
    } else {
        XCTAssert(@"Collection JSON parsing failed");
    }
#pragma clang diagnostic pop
    [self waitForExpectationsWithTimeout:5 handler:nil];
    
}

- (void)testCGFloatParsing {
    
    TSDKCollectionJSON *memberPaymentsCollection = [TSDKJSONFileResource collectionFromJSONFileNamed:@"MemberPayments"];
    NSArray *memberPayments = memberPaymentsCollection.collection;
    
    TSDKMemberPayment *paymentNoPayment = [[TSDKMemberPayment alloc] initWithCollection:memberPayments.firstObject];
    XCTAssertTrue(paymentNoPayment.amountPaid == 0.0, @"Expected zero float values for amountPaid");
    XCTAssertTrue(paymentNoPayment.amountDue == 0.0, @"Expected zero float values for amountDue");
    
    TSDKMemberPayment *paymentUpToDate = [[TSDKMemberPayment alloc] initWithCollection:memberPayments[1]];
    XCTAssertTrue(paymentUpToDate.amountPaid == 450.0, @"Expected 450 for amountPaid");
    XCTAssertTrue(paymentUpToDate.amountDue == 0.0, @"Expected zero for amountDue");
    
    TSDKMemberPayment *paymentPartial = [[TSDKMemberPayment alloc] initWithCollection:memberPayments[4]];
    XCTAssertTrue(paymentPartial.amountPaid == 200.0, @"Expected 200 for amountPaid");
    XCTAssertTrue(paymentPartial.amountDue == 250.0, @"Expected 250 for amountDue");
    
    // last payment in the array is hard-coded to have null values for amount_paid and amount_due
    TSDKMemberPayment *lastPayment = [[TSDKMemberPayment alloc] initWithCollection:memberPayments.lastObject];
    XCTAssertTrue(lastPayment.amountDue == 0.0, @"Expected 0.0 when server provides a null value");
    XCTAssertTrue(lastPayment.amountPaid == 0.0, @"Expected 0.0 when server provides a null value");
    
    paymentPartial.amountPaid = 450.0;
    paymentPartial.amountDue = 0.0;
    XCTAssertTrue(paymentPartial.amountPaid == 450.0, @"Expected 450 for amountPaid");
    XCTAssertTrue(paymentPartial.amountDue == 0.0, @"Expected zero for amountDue");
    
    TSDKMemberPayment *payment = [[TSDKMemberPayment alloc] init];
    NSString *key = @"amount_paid";
    [payment setCGFloat:2.0 forKey:key];
    CGFloat paid = [payment getCGFloat:key];
    XCTAssertTrue(paid == 2.0, @"Expected CGFloat value to be 2.0");
    XCTAssertTrue(payment.amountPaid == 2.0, @"Expected amountPaid to be 2.0");
}

- (void)testEnumParsing {    
    TSDKEvent *event = [[TSDKEvent alloc] init];
    
    XCTAssertTrue(event.gameTypeCode == TSDKGameTypeCodeUnknown, @"Event Game type code should have parsed as unknown");
    
    [event setInteger:0 forKey:@"game_type_code"];
    XCTAssertTrue(event.gameTypeCode == TSDKGameTypeCodeUnknown, @"Event Game type code should have parsed as unknown");
    
    [event setInteger:1 forKey:@"game_type_code"];
    XCTAssertTrue(event.gameTypeCode == TSDKGameTypeCodeIsHome, @"Event Game type code should have parsed as home");
    
    [event setInteger:2 forKey:@"game_type_code"];
    XCTAssertTrue(event.gameTypeCode == TSDKGameTypeCodeIsAway, @"Event Game type code should have parsed as away");

    [event setInteger:NSNotFound forKey:@"game_type_code"];
    XCTAssertTrue(event.gameTypeCode == TSDKGameTypeCodeUnknown, @"Event Game type code should have parsed as unknown");
}

@end
