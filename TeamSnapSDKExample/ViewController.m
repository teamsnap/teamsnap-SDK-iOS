//
//  ViewController.m
//  TeamSnapSDKExample
//
//  Created by Marquez Gallegos on 3/14/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import <SafariServices/SafariServices.h>
#import <TeamSnapSDK/TeamSnapSDK.h>
#import "ViewController.h"

static NSString *apiv3clientId = @"your-client-id";
static NSString *apiv3scope = @"read";
static NSString *apiv3redirectURL = @"teamsnapsdk://oauth-callback/teamsnap";

@interface ViewController ()

@property (nonatomic, assign) BOOL loggedIn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loggedIn = NO;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (!self.loggedIn) {
        [[TSDKTeamSnap sharedInstance] presentLoginInViewController:self animated:YES clientId:apiv3clientId scope:apiv3scope redirectURL:apiv3redirectURL completion:^{
            self.loggedIn = YES;
            NSLog(@"VC Presented");
        }];
    }    
}

@end
