# teamsnap-SDK-iOS
Source code for the TeamSnap iOS SDK

#iOS TemSnapSDK
Build for simulator. The universal binary will be located somewhere like:
~/Library/Developer/Xcode/DerivedData/TeamSnapSDK-bpyoduzxeamidfebntrjxkbbwxwq/Build/Products/Debug-universal/TeamSnapSDK.framework


That is what should be distributed/linked

# tvOS - TeamSnapSDKTV
Build for the tvOS simulator. The universal binary will be located somewhere like:
~/Library/Developer/Xcode/DerivedData/TeamSnapSDKTV-bpyoduzxeamidfebntrjxkbbwxwq/Build/Products/Debug-TVuniversal/TeamSnapSDK.framework

# usage
Drag the framework into your frameworks group, and copy files. 
make sure it appears under your Target->Build Phases->Link Binary With LIbraies  (happens automatically) AND
target->General->Embedded Binaries (Does not happen automatically)

To use:
#import <TeamSnapSDK/TeamSnapSDK.h>
or
#import <TeamSnapSDKTV/TeamSnapSDKTV.h>

# errors - 
dyld: Library not loaded: @rpath/TeamSnapSDK.framework/TeamSnapSDK
  Referenced from: /Users/jason/Library/Developer/CoreSimulator/Devices/CFB23620-9332-47B8-A806-C87C6647E87A/data/Containers/Bundle/Application/93B2FD30-F7BD-42DB-BCEC-C9F2D21B6CEE/scoreboad.app/scoreboad
  Reason: image not found
  
You forgot to embed the binary:
target->General->Embedded Binaries (Does not happen automatically)

