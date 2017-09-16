//
//  OBQuestCell.swift
//  OpenBank
//
//  Created by Aleksander Evtuhov on 17/09/2017.
//  Copyright © 2017 Aleksander Evtuhov. All rights reserved.
//

import UIKit

class OBQuestCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var howToAchive: UILabel!
    
    @IBOutlet weak var progress: UIProgressView!
    
    @IBOutlet weak var starStack: UIStackView!
    
    @IBOutlet weak var reward: UILabel!
    
    @IBOutlet weak var progressLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
