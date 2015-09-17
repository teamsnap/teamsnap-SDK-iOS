# teamsnap-SDK-iOS
Source code for the TeamSnap iOS SDK

Build for simulator. The binary will be located somewhere like:
~/Library/Developer/Xcode/DerivedData/TeamSnapSDK-bpyoduzxeamidfebntrjxkbbwxwq/Build/Products/Debug-universal/TeamSnapSDK.framework

That is what should be distributed/linked

# usage
Drag the framework into your frameworks group, and copy files. 
make sure it appears under your Target->Build Phases->Link Binary With LIbraies  (happens automatically) AND
target->General->Embedded Binaries (Does not happen automatically)
