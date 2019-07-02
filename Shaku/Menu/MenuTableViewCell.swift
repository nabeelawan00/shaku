//
//  MenuTableViewCell.swift
//  MakStores
//
//  Created by Ali Ahsan on 8/18/18.
//  Copyright © 2018 Half Tech. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var iconImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
