//
//  CatogoryCell.swift
//  Shaku
//
//  Created by Mudassar on 16/02/2019.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import UIKit

class CatogoryCell: UITableViewCell {

    @IBOutlet weak fileprivate var titleLabel: UILabel!
    @IBOutlet weak fileprivate var detailsLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension CatogoryCell {
    func configCatogoryCell(item :Category , indexPath: IndexPath){
        titleLabel.text = item.name
        detailsLable.text = item.descriptionField
    }
}
