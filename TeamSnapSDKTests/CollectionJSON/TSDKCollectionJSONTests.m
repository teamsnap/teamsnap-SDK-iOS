//
//  TSDKCollectionJSONTests.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/5/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TSDKCollectionJSON.h"
#import "NSDictionary+TSDKCollectionJSON.h"
#import "NSDictionary+dump.h"
#import "NSString+TSDKConveniences.h"

@interface TSDKCollectionJSONTests : XCTestCase

@end

@implementation TSDKCollectionJSONTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testDctionaryToCollectionJSON {
    NSDictionary *dictionary1 = @{@"name1":@"test1",@"int1":@1};
    NSDictionary *result1 = [dictionary1 collectionJSONTemplate];
    
    XCTAssertTrue(result1.count==1, "Unexpected top level dictionary size.");
    
    XCTAssertTrue([result1[@"template"] isKindOfClass:[NSDictionary class]], "Template should be a dictionary");
    
    XCTAssertTrue([result1[@"template"][@"data"] isKindOfClass:[NSArray class]], "Template should be a dictionary");
    
    NSArray *data = result1[@"template"][@"data"];
    
    XCTAssertTrue(data.count==2, "Data should contain 2 name/value pairs");
    
    BOOL lFound = NO;
    
    NSString *expectedName = @"name1";
    NSString *expectedValue = @"test1";
    for (NSDictionary *nameValuePair in data) {
        if (([nameValuePair[@"name"] isEqualToString:expectedName]) &&
            ([nameValuePair[@"value"] isEqualToString:expectedValue])) {
            lFound = YES;
            break;
        }
    }
    
    XCTAssertTrue(lFound, "Name 1 not found or value incorrect in dictionary");
    
    lFound = NO;
    
    expectedName = @"int1";
    NSNumber *expectedIntValue = @1;
    for (NSDictionary *nameValuePair in data) {
        if (([nameValuePair[@"name"] isEqualToString:expectedName]) &&
            ([nameValuePair[@"value"] isEqualToValue:expectedIntValue])) {
            lFound = YES;
            break;
        }
    }
    
    XCTAssertTrue(lFound, "1 not found or value incorrect in dictionary");
}

- (void)testInitWithJSON{
    NSString *jsonString = @"{\"collection\":{\"version\":\"3.177.2\",\"href\":\"https://api.teamsnap.com/v3/users\",\"rel\":\"users\",\"template\":{\"data\":[{\"name\":\"first_name\",\"value\":null},{\"name\":\"last_name\",\"value\":null},{\"name\":\"password\",\"value\":null},{\"name\":\"birthday\",\"value\":null},{\"name\":\"email\",\"value\":null},{\"name\":\"facebook_id\",\"value\":null},{\"name\":\"facebook_access_token\",\"value\":null},{\"name\":\"type\",\"value\":\"user\"}]},\"links\":[{\"rel\":\"members\",\"href\":\"https://api.teamsnap.com/v3/members\"},{\"rel\":\"teams\",\"href\":\"https://api.teamsnap.com/v3/teams\"},{\"rel\":\"teams_preferences\",\"href\":\"https://api.teamsnap.com/v3/teams_preferences\"},{\"rel\":\"root\",\"href\":\"https://api.teamsnap.com/v3/\"},{\"rel\":\"self\",\"href\":\"https://api.teamsnap.com/v3/me\"}],\"queries\":[{\"rel\":\"search\",\"href\":\"https://api.teamsnap.com/v3/users/search\",\"data\":[{\"name\":\"id\",\"value\":null}]}],\"items\":[{\"href\":\"https://api.teamsnap.com/v3/users/2\",\"data\":[{\"name\":\"id\",\"value\":2},{\"name\":\"type\",\"value\":\"user\"},{\"name\":\"address_country\",\"value\":null},{\"name\":\"address_state\",\"value\":null},{\"name\":\"birthday\",\"value\":\"1970-05-01\"},{\"name\":\"email\",\"value\":\"manager@example.com\"},{\"name\":\"facebook_access_token\",\"value\":null},{\"name\":\"facebook_id\",\"value\":null},{\"name\":\"first_name\",\"value\":\"Tester\"},{\"name\":\"is_eligible_for_free_trial\",\"value\":false},{\"name\":\"last_name\",\"value\":\"Joe\"},{\"name\":\"receives_newsletter\",\"value\":false},{\"name\":\"teams_count\",\"value\":2},{\"name\":\"created_at\",\"value\":\"2015-08-12T22:17:13Z\",\"type\":\"DateTime\"},{\"name\":\"updated_at\",\"value\":\"2016-01-20T19:15:28Z\",\"type\":\"DateTime\"}],\"links\":[{\"rel\":\"active_teams\",\"href\":\"https://api.teamsnap.com/v3/teams/active?user_id=2\"},{\"rel\":\"members\",\"href\":\"https://api.teamsnap.com/v3/members/search?user_id=2\"},{\"rel\":\"teams\",\"href\":\"https://api.teamsnap.com/v3/teams/search?user_id=2\"},{\"rel\":\"personas\",\"href\":\"https://api.teamsnap.com/v3/members/personas?user_id=2\"},{\"rel\":\"teams_preferences\",\"href\":\"https://api.teamsnap.com/v3/teams_preferences/search?user_id=2\"},{\"rel\":\"facebook_pages\",\"href\":\"https://api.teamsnap.com/v3/facebook_pages/search\"}],\"rel\":\"user-2\"}]}}";
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    TSDKCollectionJSON *collectionJSON = [[TSDKCollectionJSON alloc] initWithJSON:JSON];
    if (!collectionJSON) {
        XCTAssert(@"Collection JSON Nil");
    }
    
    XCTAssertEqualObjects(collectionJSON.href, [NSURL URLWithString:@"https://api.teamsnap.com/v3/users"]);
    
    if ([collectionJSON.collection count]==0) {
        XCTAssert(@"No Collection Objects");
    }
    TSDKCollectionJSON *subCollection = collectionJSON.collection[0];
    if (!subCollection) {
        XCTAssert(@"Sub Collection JSON Nil");
    }
    if ([subCollection.data count]!=15) {
        XCTAssert(@"Sub Collection Data count wrong");
    }
    
    NSDictionary *expectedData = @{@"id":@2,@"teams_count":@2,@"facebook_id":[NSNull null],@"receives_newsletter":@0,@"created_at":@"2015-08-12T22:17:13Z",@"address_state":[NSNull null],@"is_eligible_for_free_trial":@0,@"type":@"user",@"birthday":@"1970-05-01",@"first_name":@"Tester",@"facebook_access_token":[NSNull null],@"updated_at":@"2016-01-20T19:15:28Z",@"last_name":@"Joe",@"email":@"manager@example.com",@"address_country":[NSNull null]};
    
    XCTAssertEqualObjects(subCollection.data, expectedData);
    
    XCTAssertEqualObjects(subCollection.data[@"id"], [NSNumber numberWithInteger:2]);
}

- (void)testDateConversion {
    NSDate *date = [@"2016-03-22T13:34:04Z" dateFromRCF3339DateTimeString];
    XCTAssertNotNil(date, "Date conversion failed");
    
    NSDate *secondDate = [@"2016-04-12T00:00:00.000+00:00" dateFromRCF3339DateTimeString];
    XCTAssertNotNil(secondDate, "Date conversion failed");

    NSDate *thirdDate = [@"2016-04-12T00:00:00+00:00" dateFromRCF3339DateTimeString];
    XCTAssertNotNil(thirdDate, "Date conversion failed");
    
}

@end
