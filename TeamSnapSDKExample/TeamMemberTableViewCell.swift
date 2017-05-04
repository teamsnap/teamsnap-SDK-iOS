//
//  TeamMemberTableViewCell.swift
//  TeamSnapSDK
//
//  Created by James Hays on 5/4/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

import UIKit

class TeamMemberTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var uniformNumberLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        thumbnailImageView.layer.cornerRadius = thumbnailImageView.frame.width / 2.0
        thumbnailImageView.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
        nameLabel.text = nil
        positionLabel.text = nil
        uniformNumberLabel.text = nil
    }
}
