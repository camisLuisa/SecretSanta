//
//  FriendGroupTableViewCell.swift
//  SecretSanta
//
//  Created by Camila Luísa on 01/02/21.
//  Copyright © 2021 Camila Luisa Farias de Lima. All rights reserved.
//

import UIKit

class FriendGroupTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var participantsNumberLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(groupInfo: FriendGroup) {
        titleLabel.text = groupInfo.name
        participantsNumberLabel.text = " \(groupInfo.friends.count) participantes"
        eventDateLabel.text = groupInfo.eventDate.getStringFromDate(formatter: "dd/MM/YY")
    }
    
}
