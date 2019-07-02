//
//  StoreCollectionViewCell.swift
//  Shaku
//
//  Created by Ali Ahsan on 2/14/19.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak fileprivate var imageView: UIImageView!
    @IBOutlet weak fileprivate var storeName: UILabel!
    @IBOutlet weak fileprivate var storeDescription: UILabel!
}

extension StoreCollectionViewCell {
    
    func configStoreCell(item :Store , indexPath: IndexPath){
        storeName.text = item.name
        storeDescription.text = item.descriptionField
        let url = item.image
        imageView.sd_setImage(with: URL(string: url ?? ""), placeholderImage:UIImage(named: "placeholder"), options: .retryFailed, completed: nil)
    }
}
