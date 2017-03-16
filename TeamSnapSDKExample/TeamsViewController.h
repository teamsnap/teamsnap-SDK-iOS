//
//  TeamsViewController.h
//  TeamSnapSDK
//
//  Created by Marquez Gallegos on 3/15/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TSDKUser;

@interface TeamsViewController : UIViewController <UITableViewDataSource>

- (instancetype)initWithUser:(TSDKUser *)user;

@end
