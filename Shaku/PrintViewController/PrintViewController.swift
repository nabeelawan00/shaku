//
//  PrintViewController.swift
//  Shaku
//
//  Created by Bills on 04/08/2019.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import UIKit

class PrintViewController: UIViewController {

    @IBOutlet weak var placeholderImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var experiyLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet var parentView: UIView!
    var couponItem: Coupon?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        congFigView(item: couponItem!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func removeSuperBtnAction(_ sender: UIButton) {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    func congFigView(item: Coupon) {
        
        titleLbl.text = item.title
        descriptionLbl.text = item.descriptionField
        experiyLbl.text = item.expiration ?? ""
        
        let url = WebServices.imageBaseURL + (item.image ?? "")
        placeholderImage.sd_setImage(with: URL(string: url), placeholderImage:UIImage(named: "placeholder"), options: .retryFailed, completed: nil)
    }

}
