//
//  BaseTeamsViewController.swift
//  TeamSnap-Practical
//
//  Created by Lars Anderson on 10/15/20.
//

import Foundation
import TeamSnapSDK

class BaseTeamsViewController : UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var loggedIn: Bool {
        TSDKTeamSnap.sharedInstance().teamSnapUser != nil
    }
    var user: TSDKUser!
    var teams: [TSDKTeam] = []
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if loggedIn == false {
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(self.handleLoginSuccess),
                name: TSNotifications.DidLogin,
                object: nil
            )
        } else {
            loadTeams()
        }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
    
    @objc func handleLoginSuccess() {
        user = TSDKTeamSnap.sharedInstance().teamSnapUser
        loadTeams()
    }
    
    func loadTeams() {
        user.getTeamsWith(TSDKRequestConfiguration()) { success, complete, teams, error in
            DispatchQueue.main.async {
                self.teams = teams
                self.tableView.reloadData()
            }
        }
    }
}

extension BaseTeamsViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath)
        let team = teams[indexPath.row]
        cell.textLabel?.text = team.name
        return cell
    }
}
