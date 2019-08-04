//
//  CouponCell.swift
//  Shaku
//
//  Created by Mudassar on 16/02/2019.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import UIKit
import SDWebImage

class CouponCell: UITableViewCell {

    @IBOutlet weak fileprivate var placeImageView: UIImageView!
    @IBOutlet weak fileprivate var totalNumer: UILabel!
    @IBOutlet weak fileprivate var expireDate: UILabel!
    @IBOutlet weak fileprivate var desLabel: UILabel!
    @IBOutlet weak fileprivate var title: UILabel!
    @IBOutlet weak var printBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        printBtn.backgroundColor = .clear
        printBtn.layer.borderWidth = 1
        printBtn.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension CouponCell {
    func configCouponCell(item :Coupon , indexPath: IndexPath){
        printBtn.tag = indexPath.row
        shareBtn.tag = indexPath.row
        
        title.text = item.title
        desLabel.text = item.descriptionField
        let click = item.clicks ?? ""
        totalNumer.text = click + " Used "
        let exp = item.expiration ?? ""
        expireDate.text = "Expiries: " + exp
        let url = WebServices.imageBaseURL + (item.image ?? "")
        placeImageView.sd_setImage(with: URL(string: url), placeholderImage:UIImage(named: "placeholder"), options: .retryFailed, completed: nil)
    
    }
    
}
