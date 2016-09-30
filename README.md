# teamsnap-SDK-iOS
TeamSnap iOS SDK
For information on the TeamSnap API, and to get client tokens for your application check out http://developer.teamsnap.com

# Installing as a Framework
Drag the framework into your frameworks group, and copy files. 
make sure it appears under your Target->Build Phases->Link Binary With LIbraies  (happens automatically) AND
target->General->Embedded Binaries (Does not happen automatically)

# Installation with CocoaPods

[CocoaPods](http://cocoapods.org/) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. See the [Get Started](http://cocoapods.org/#get_started) section for more details.

# Podfile
```
platform :ios, '8.0'
pod 'TeamSnapSDK', '~>1.0'
```

If you are using Swift, be sure to add `use_frameworks!` and set your target to iOS 8+:
```
platform :ios, '8.0'
use_frameworks!
```

Now run ```pod install```

# Usage

To use:
```objective-c
#import <TeamSnapSDK/TeamSnapSDK.h>
```
or
```objective-c
#import <TeamSnapSDKTV/TeamSnapSDKTV.h>
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

