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
#import "NSDictionary+dump.h"

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
        XCTAssertEqualObjects([[user.collection data] valueForKey:@"last_name"], [NSNull null]);
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
    [event.changedValues removeAllObjects];
    
    event.name = testValue;
    XCTAssertEqual(event.name, testValue);
    XCTAssertNil([event.changedValues objectForKey:@"name"]);

    NSString *newValue = @"New event Name";

    event.name = newValue;
    XCTAssertEqual(event.name, newValue);
    XCTAssertNotNil([event.changedValues objectForKey:@"name"]);
    XCTAssertEqual([event.changedValues objectForKey:@"name"], testValue);
}

- (void)testSettingAndReadingDates {
    TSDKEvent *event = [[TSDKEvent alloc] init];
    NSDate *referenceDate = [NSDate dateWithTimeIntervalSince1970:1461074742.0];
    [event setStartDate:referenceDate];
    XCTAssertNotNil(event.startDate);
    NSLog(@"Start Date %@ %@", event.startDate, [event.collection.data objectForKey:@"start_date"]);
    
    XCTAssertEqual(event.startDate, referenceDate);
}

@end
