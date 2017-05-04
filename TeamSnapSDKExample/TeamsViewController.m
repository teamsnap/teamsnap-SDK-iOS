//
//  TeamsViewController.m
//  TeamSnapSDK
//
//  Created by Marquez Gallegos on 3/15/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import "TeamsViewController.h"
#import "TeamSnapSDKExample-Swift.h"

@interface TeamsViewController ()

@property (nonatomic, strong) NSArray<TSDKTeam*> *teams;

@end

@implementation TeamsViewController

- (void)loadTeamsWithUser:(TSDKUser *)user {
    NSParameterAssert(user);

    [user getTeamsWithConfiguration:[TSDKRequestConfiguration new] completion:^(BOOL success, BOOL complete, NSArray<TSDKTeam *> * _Nonnull teams, NSError * _Nullable error) {
        if (!success || error != nil) {
            // I don't see much detail as to what caused the alert with what I could simulate.  I don't want to display locallized messages from the NSError object until I know its contents, so this generic error will have to suffice. -- James
            [self showAlert:@"An Error has occured, please try again later" title:nil];
            return;
        }

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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowTeamMembersSegue"]) {
        NSParameterAssert([segue.destinationViewController isKindOfClass:TeamMembersViewController.class]);
        NSParameterAssert([sender isKindOfClass:UITableViewCell.class]);

        TeamMembersViewController *membersVC = segue.destinationViewController;
        UITableViewCell *cell = sender;
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        TSDKTeam *team = [self teamAtIndexPath:indexPath];
        membersVC.team = team;
    }
}

-(TSDKTeam*)teamAtIndexPath:(NSIndexPath*)indexPath {
    return self.teams[indexPath.row];
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
