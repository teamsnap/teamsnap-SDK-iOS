//
//  ViewController.m
//  TeamSnapSDKExample
//
//  Created by Marquez Gallegos on 3/14/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SFSafariViewController *safariViewController = [[TSDKTeamSnap sharedInstance] presentLoginInViewController:self animated:YES clientId:@"XXXXXXXXXXXXXXXXXX" scope:@"read+write" redirectURL:@"customURL://" completion:^{
        NSLog(@"VC Presented");
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
