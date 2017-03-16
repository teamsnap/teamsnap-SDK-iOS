//
//  TeamsViewController.m
//  TeamSnapSDK
//
//  Created by Marquez Gallegos on 3/15/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import "TeamsViewController.h"
#import <TeamSnapSDK/TeamSnapSDK.h>

@interface TeamsViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) TSDKUser *user;
@property (nonatomic, strong) NSArray<TSDKTeam*> *teams;

@end

@implementation TeamsViewController

- (instancetype)initWithUser:(TSDKUser *)user {
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        self->_user = user;
    }
    return self;
}

- (void)loadTeams {
    [self.user getTeamsWithConfiguration:[TSDKRequestConfiguration new] completion:^(BOOL success, BOOL complete, NSArray<TSDKTeam *> * _Nonnull teams, NSError * _Nullable error) {
        self.teams = teams;
        [self.tableView reloadData];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"TeamCell"];
    self.navigationItem.title = NSLocalizedString(@"Teams", nil);
    [self loadTeams];
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
