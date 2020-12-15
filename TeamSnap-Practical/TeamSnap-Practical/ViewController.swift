//
//  ViewController.swift
//  TeamSnap-Practical
//
//  Created by Lars Anderson on 10/15/20.
//

import UIKit
import TeamSnapSDK

class ViewController: BaseTeamsViewController, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let team = teams[indexPath.row]
        
        //TODO: Begin prompt on team selection here
    }
}

