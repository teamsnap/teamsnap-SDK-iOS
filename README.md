# teamsnap-SDK-iOS
TeamSnap iOS SDK
For information on the TeamSnap API, and to get client tokens for your application check out [developer.teamsnap.com](http://developer.teamsnap.com).

# Installing as a Framework
Drag the framework into your frameworks group, and copy files. 
make sure it appears under your `{target_name}->Build Phases->Link Binary With Libraries` (happens automatically) AND
`{target_name}->General->Embedded Binaries` (Does not happen automatically)

# Installation with CocoaPods

[CocoaPods](http://cocoapods.org/) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. See the [Get Started](http://cocoapods.org/#get_started) section for more details.

# Podfile
```
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'

target 'Teamsnap' do
pod 'TeamSnapSDK', :git => 'git@github.com:teamsnap/teamsnap-SDK-iOS.git', :branch => 'master'
end
```

If you are using Swift, be sure to add `use_frameworks!` and set your target to iOS 8+:
```
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'
use_frameworks!

target 'Teamsnap' do
pod 'TeamSnapSDK', :git => 'git@github.com:teamsnap/teamsnap-SDK-iOS.git', :branch => 'master'
end
```

Now run ```pod install```

# Setup

In order to use the TeamSnapSDK, you will need to obtain a client ID and client secret for your specific application. You can create new applications and obtain these from [auth.teamsnap.com](https://auth.teamsnap.com/oauth/applications).

Before using the TeamSnapSDK, you need to configure TSDKTeamSnap with your new credentials:

Objective-C
``` objc
[[TSDKTeamSnap sharedInstance] setClientId:myClientID];
[[TSDKTeamSnap sharedInstance] setClientSecret:myClientSecret];
```

Swift
``` swift
TSDKTeamSnap.sharedInstance.clientId = myClientID
TSDKTeamSnap.sharedInstance.clientSecret = myClientSecret
```

# Usage

To use:

Objective-C
```objective-c
#import <TeamSnapSDK/TeamSnapSDK.h>
```

Swift
```swift
import TeamSnapSDK
```

# Sample Code:
From a viewController
```objective-c
SFSafariViewController *safariViewController = [[TSDKTeamSnap sharedInstance] presentLoginInViewController:self animated:YES clientId:@"XXXXXXXXXXXXXXXXXX" scope:@"read+write" redirectURL:@"customURL://" completion:^{
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
        return YES;
    } else {
        NSLog(@"Not Processed");
        return NO;
    }
}
```

in your info.plist:
Add a URL type with a URL scheme that matches your callback URL from Above
```JSON
	<key>CFBundleURLTypes</key>
	<array>
		<dict>
			<key>CFBundleURLName</key>
			<string>com.example.playerlineup</string>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>customURL</string>
			</array>
		</dict>
	</array>
```


# Errors - 
```
dyld: Library not loaded: @rpath/TeamSnapSDK.framework/TeamSnapSDK
Referenced from: /Users/jason/Library/Developer/CoreSimulator/Devices/CFB23620-9332-47B8-A806-C87C6647E87A/data/Containers/Bundle/Application/93B2FD30-F7BD-42DB-BCEC-C9F2D21B6CEE/scoreboad.app/scoreboad
Reason: image not found
```
  
You forgot to embed the binary:
target->General->Embedded Binaries (Does not happen automatically)

# Building iOS TeamSnapSDK
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

# Candidate Interview
## Instructions & Expectations

Welcome to the TeamSnap iOS team candidate practical! We like what we see in you so far, and would like to see what kind of work you produce. We'd like to see your code, learn about your sense of style and level of quality, and get a sense of what working with each other would be like. To that end, we've designed a mini-project that simulates a real-world project. We hope that it's manageable and small enough to be respectful of your time.

Because you're likely busy with work and life, we don't have a specific deadline.  It shouldn't take too long, perhaps 2-6 hours, but take what you need or want to make something you're proud of.  All we ask is that you keep us in the loop and manage our expectations.. we don't want to negatively impact your home life or work.

## Overview

Check out the Candidate-Practical branch from this repo.

This code is a working implementation of the TeamSnap SDK integrated into a sample project. The project handles authentication on a test account with a single team that is pre-populated with players(called Members in our API), as well as a simple UI to select a team. Your entry point is the selection of the team from that list.

Note: The sample project was created using Xcode 12.0.1 with support for iOS 13/14 and was tested recently using Xcode 14.3 and iOS 15 (the same as our production app).

## Your Role

We are exploring some new creative ideas on how to lay out our team’s participants to make it not only visually appealing but user friendly as it's used very heavily within our application. We’ve asked several folks on the team to do a spike and share back what they’ve done so we can have some great starting points to build out our next version of this view.

Note: .. no need to go too crazy on design(or be stressed) as we have those here, just doing some fun setup scenario.

## The Ask(requirements)

As a participant on the team, I want to see all of the other participantsso that I know who’s on the team.

As a participant on the team, I want to be able to sort the list of participants so that I can quickly find others.

Feel free to take some creative freedom here and add any other capabilities that you like. If you see something you want to refactor, go for it! During implementation, select your own default starting states for anything not specified here.

We expect at least part of your solution to demonstrate understanding of SwiftUI concepts.

Note: Members have data like first name, last name, position, jersey number, and photo. Not all of this data will be present in every member. You can display this in any way you'd like.
 

## Bonus Points(if you’ve got time)

NEW REQUIREMENT As a participant, I’d like to be able to search the other participants on my team, so that I can quickly find someone specific.

## Finishing Up

Send us over to review

zip it up and send it over

Note: please don’t submit a PR on github, trying to keep that repo clean for future exercises

What to expect during the practical exercise review

Share your screen to walk us through your implementation: application and the code behind it

Walk us through your approach and thinking

Be prepared to answer questions that dig into your approach and the code
