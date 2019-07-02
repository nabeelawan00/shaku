//
//  ItemCell.swift
//  Shaku
//
//  Created by Mudassar on 16/02/2019.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak fileprivate var mainImage: UIImageView!
    @IBOutlet weak fileprivate var expirdate: UILabel!
    @IBOutlet weak fileprivate var mangnitLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ItemCell {
    
    func configItemCell(item :CouponHome , indexPath: IndexPath){
        expirdate.text = item.expiration
        mangnitLable.text = item.title
        let url = item.image
        mainImage.sd_setImage(with: URL(string: url ?? ""), placeholderImage:UIImage(named: "drawer_backimage"), options: .retryFailed, completed: nil)
    }
}
