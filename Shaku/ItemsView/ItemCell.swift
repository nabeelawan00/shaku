//
//  ItemCell.swift
//  Shaku
//
//  Created by Mudassar on 16/02/2019.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
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
    
    func configItemCell(item: Coupon , indexPath: IndexPath){
        expirdate.text = item.expiration
        titleLbl.text = item.title
        mangnitLable.text = item.descriptionField
        let url = WebServices.imageBaseURL + item.image!
        if let url = item.image {
            print("Image URl of Home APi is nill")
        }
       let completeURL = WebServices.imageBaseURL + url
        mainImage.sd_setImage(with: URL(string: completeURL), placeholderImage:UIImage(named: "drawer_backimage"), options: .retryFailed, completed: nil)
    }
}
