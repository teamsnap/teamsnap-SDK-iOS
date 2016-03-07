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

@interface TSDKCollectionObject : XCTestCase

@end

@implementation TSDKCollectionObject

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitWithCollection {
    NSString *jsonString = @"{\"collection\":{\"version\":\"3.177.2\",\"href\":\"https://api.teamsnap.com/v3/users\",\"rel\":\"users\",\"template\":{\"data\":[{\"name\":\"first_name\",\"value\":null},{\"name\":\"last_name\",\"value\":null},{\"name\":\"password\",\"value\":null},{\"name\":\"birthday\",\"value\":null},{\"name\":\"email\",\"value\":null},{\"name\":\"facebook_id\",\"value\":null},{\"name\":\"facebook_access_token\",\"value\":null},{\"name\":\"type\",\"value\":\"user\"}]},\"links\":[{\"rel\":\"members\",\"href\":\"https://api.teamsnap.com/v3/members\"},{\"rel\":\"teams\",\"href\":\"https://api.teamsnap.com/v3/teams\"},{\"rel\":\"teams_preferences\",\"href\":\"https://api.teamsnap.com/v3/teams_preferences\"},{\"rel\":\"root\",\"href\":\"https://api.teamsnap.com/v3/\"},{\"rel\":\"self\",\"href\":\"https://api.teamsnap.com/v3/me\"}],\"queries\":[{\"rel\":\"search\",\"href\":\"https://api.teamsnap.com/v3/users/search\",\"data\":[{\"name\":\"id\",\"value\":null}]}],\"items\":[{\"href\":\"https://api.teamsnap.com/v3/users/2\",\"data\":[{\"name\":\"id\",\"value\":2},{\"name\":\"type\",\"value\":\"user\"},{\"name\":\"address_country\",\"value\":null},{\"name\":\"address_state\",\"value\":null},{\"name\":\"birthday\",\"value\":\"1970-05-01\"},{\"name\":\"email\",\"value\":\"manager@example.com\"},{\"name\":\"facebook_access_token\",\"value\":null},{\"name\":\"facebook_id\",\"value\":null},{\"name\":\"first_name\",\"value\":\"Tester\"},{\"name\":\"is_eligible_for_free_trial\",\"value\":false},{\"name\":\"last_name\",\"value\":\"Joe\"},{\"name\":\"receives_newsletter\",\"value\":false},{\"name\":\"teams_count\",\"value\":2},{\"name\":\"created_at\",\"value\":\"2015-08-12T22:17:13Z\",\"type\":\"DateTime\"},{\"name\":\"updated_at\",\"value\":\"2016-01-20T19:15:28Z\",\"type\":\"DateTime\"}],\"links\":[{\"rel\":\"active_teams\",\"href\":\"https://api.teamsnap.com/v3/teams/active?user_id=2\"},{\"rel\":\"members\",\"href\":\"https://api.teamsnap.com/v3/members/search?user_id=2\"},{\"rel\":\"teams\",\"href\":\"https://api.teamsnap.com/v3/teams/search?user_id=2\"},{\"rel\":\"personas\",\"href\":\"https://api.teamsnap.com/v3/members/personas?user_id=2\"},{\"rel\":\"teams_preferences\",\"href\":\"https://api.teamsnap.com/v3/teams_preferences/search?user_id=2\"},{\"rel\":\"facebook_pages\",\"href\":\"https://api.teamsnap.com/v3/facebook_pages/search\"}],\"rel\":\"user-2\"}]}}";
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    TSDKCollectionJSON *collectionJSON = [[TSDKCollectionJSON alloc] initWithJSON:JSON];
    TSDKCollectionObject *collectionObject = [[TSDKCollectionObject alloc] initWithCollection:collectionJSON];
    
}

@end
