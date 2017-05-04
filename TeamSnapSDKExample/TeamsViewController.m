//
//  TeamsViewController.m
//  TeamSnapSDK
//
//  Created by Marquez Gallegos on 3/15/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import "TeamsViewController.h"
#import <TeamSnapSDK/TeamSnapSDK.h>

#import "TeamSnapSDKExample-Swift.h"

@interface TeamsViewController ()

@property (nonatomic, strong) NSArray<TSDKTeam*> *teams;

@end

@implementation TeamsViewController

- (void)loadTeamsWithUser:(TSDKUser *)user {
    NSParameterAssert(user);

    [user getTeamsWithConfiguration:[TSDKRequestConfiguration new] completion:^(BOOL success, BOOL complete, NSArray<TSDKTeam *> * _Nonnull teams, NSError * _Nullable error) {
        self.teams = teams;
        [self.tableView reloadData];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"Teams", nil);
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self loadTeamsWithUser:self.authenticatedUser];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.teams.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeamCell"];
    TSDKTeam *team = [self.teams objectAtIndex:indexPath.row];
    cell.textLabel.text = team.name;
    return cell;
}

@end
