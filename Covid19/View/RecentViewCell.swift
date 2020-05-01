//
//  RecentViewCell.swift
//  Covid19
//
//  Created by Danish Khan on 30/04/20.
//  Copyright © 2020 Danish Khan. All rights reserved.
//

import UIKit

class RecentViewCell: UITableViewCell {

    @IBOutlet weak var deathLabel: UILabel!
    @IBOutlet weak var countyLabel: UILabel!
    @IBOutlet weak var recoverLabel: UILabel!
    @IBOutlet weak var confirmCaseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
