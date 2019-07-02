//
//  ProductTableViewCell.swift
//  Shaku
//
//  Created by Ali Ahsan on 2/14/19.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet var NewPrice: UILabel!
    @IBOutlet var oldAmount: UILabel!
    @IBOutlet var productExpiry: UILabel!
    @IBOutlet var productDescription: UILabel!
    @IBOutlet var productName: UILabel!
    @IBOutlet var productImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
