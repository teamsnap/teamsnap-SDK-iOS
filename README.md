# teamsnap-SDK-iOS
Source code for the TeamSnap iOS SDK

#iOS TemSnapSDK
Build for simulator. The universal binary will be located somewhere like:
```
~/Library/Developer/Xcode/DerivedData/TeamSnapSDK-bpyoduzxeamidfebntrjxkbbwxwq/Build/Products/Debug-universal/TeamSnapSDK.framework
```

That is what should be distributed/linked

# tvOS - TeamSnapSDKTV
Build for the tvOS simulator. The universal binary will be located somewhere like:
```
~/Library/Developer/Xcode/DerivedData/TeamSnapSDKTV-bpyoduzxeamidfebntrjxkbbwxwq/Build/Products/Debug-TVuniversal/TeamSnapSDKTV.framework
```

# usage
Drag the framework into your frameworks group, and copy files. 
make sure it appears under your Target->Build Phases->Link Binary With LIbraies  (happens automatically) AND
target->General->Embedded Binaries (Does not happen automatically)

To use:
```objective-c
#import <TeamSnapSDK/TeamSnapSDK.h>
```
or
```objective-c
#import <TeamSnapSDKTV/TeamSnapSDKTV.h>
```

# sample Code:
From a viewController
```objective-c
        SFSafariViewController *safariViewController = [[TSDKTeamSnap sharedInstance] presentLoginInViewController:self animated:YES clientId:@"" scope:@"read+write" redirectURL:@"customURL://" completion:^{
            NSLog(@"VC Presented");
        }];
```

in your applicationDelegate:
```objective-c
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options {
    if ([[TSDKTeamSnap sharedInstance] processLoginCallback:url completion:^(bool success, NSString *message) {
        if (success) {
            NSLog(@"Logged in %@", [[[TSDKTeamSnap sharedInstance] teamSnapUser] firstName]);
        } else {
            NSLog(@"Login Failed");
        }
    }]) {
        // dismiss the Safari View Controller from step 1
        return YES;
    } else {
        NSLog(@"Not Processed");
        return NO;
    }
}
```

```objective-c
    [[TSDKTeamSnap sharedInstance] loginWithUserName:@"" andPassword:@"" completion:^(bool success, NSString *message) {
        [[[TSDKTeamSnap sharedInstance] teamSnapUser] teamsWithCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
            self.teams = objects;
            for (TSDKTeam *team in self.teams) {
                if ([team.name isEqualToString:@"Rebels 12U"]) {
                    [weakSelf getmembersForTeam:team];
                }
            }
        }];
    }];
```

# errors - 
```
dyld: Library not loaded: @rpath/TeamSnapSDK.framework/TeamSnapSDK
Referenced from: /Users/jason/Library/Developer/CoreSimulator/Devices/CFB23620-9332-47B8-A806-C87C6647E87A/data/Containers/Bundle/Application/93B2FD30-F7BD-42DB-BCEC-C9F2D21B6CEE/scoreboad.app/scoreboad
Reason: image not found
```
  
You forgot to embed the binary:
target->General->Embedded Binaries (Does not happen automatically)

