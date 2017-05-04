//
//  TeamMembersViewController.swift
//  TeamSnapSDK
//
//  Created by James Hays on 5/4/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

import UIKit
import TeamSnapSDK

class TeamMembersViewController: UITableViewController {

    var team: TSDKTeam! {
        didSet {
            loadMembers(for: team)
        }
    }
    
    private var teamMembers: [TSDKMember] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let teamName = (team.name as String?)?.nullifiedEmptyString
        self.title = teamName ?? NSLocalizedString("Team Members", comment: "")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamMembers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamMemberCell", for: indexPath)
        
        let member = teamMember(for: indexPath)
        if let cell = cell as? TeamMemberTableViewCell {
            cell.nameLabel.text = member.fullName()
            
            if let position = member.position as String? {
                cell.positionLabel.text = position.isEmpty ? nil : position
            }
            
            cell.positionLabel.text = (member.position as String?)?.nullifiedEmptyString
            cell.uniformNumberLabel.text = member.formattedJerseyNumber?.nullifiedEmptyString
            cell.thumbnailImageView.image = #imageLiteral(resourceName: "default_avatar")
            if let url: URL = member.linkMemberThumbnail as URL? {
                URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                    guard let imageData = data,
                        let image = UIImage(data: imageData) else { return }
                    
                    DispatchQueue.main.async {
                        if let cell = self.tableView.cellForRow(at: indexPath) as? TeamMemberTableViewCell {
                            cell.thumbnailImageView.image = image
                        }
                    }
                }).resume()
            }
        }

        return cell
    }
    
    private func teamMember(for indexpath: IndexPath) -> TSDKMember {
        return teamMembers[indexpath.row]
    }
    private func loadMembers(for team: TSDKTeam) {
        team.getMembersWith(nil) { (success, requestComplete, members, error) in
            if !success || !requestComplete || error != nil {
                // I don't see much detail as to what caused the alert with what I could simulate.  I don't want to display locallized messages from the NSError object until I know its contents, so this generic error will have to suffice. -- James
                self.showAlert("An Error has occured, please try again later")
                return
            }
            
            self.teamMembers = members ?? []
        }
    }
}

extension TSDKMember {
    var formattedJerseyNumber: String? {
        guard let number = self.jerseyNumber as String? else { return nil }
        var jerseyNumber = number
        
        // Since jersey number is a string, it's possible there is already a '#" character.  Don't add a second. -- James
        if jerseyNumber.characters.count > 0 && jerseyNumber.characters.first != "#" {
            jerseyNumber.insert("#", at: jerseyNumber.startIndex)
        }
        return jerseyNumber
    }
}
