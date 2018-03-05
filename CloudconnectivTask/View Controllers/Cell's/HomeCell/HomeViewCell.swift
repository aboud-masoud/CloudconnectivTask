//
//  HomeViewCell.swift
//  CloudconnectivTask
//
//  Created by mac on 3/4/18.
//  Copyright © 2018 OrderEra. All rights reserved.
//

import UIKit

class HomeViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileTitle: UILabel!
    @IBOutlet weak var profileBranch: UILabel!
    @IBOutlet weak var ipAddress: UILabel!
    @IBOutlet weak var deviceIPSubnetMask: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var desc: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Design.setupViewCorners(view: profileImage, corners: [.allCorners])
        Design.setupViewCorners(view: statusView, corners: [.allCorners])
        Design.setupViewCorners(view: desc, corners: [.allCorners])
    }
}
