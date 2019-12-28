//
//  CouponViewController.swift
//  Shaku
//
//  Created by qazi ammar arshad on 2/9/19.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import UIKit
import MBProgressHUD

class CouponViewController: UIViewController {
    
    fileprivate var coupon : [Coupon]?
    @IBOutlet weak fileprivate var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        callApi()
    }
    
    
    @IBAction func shareBtnAction(_ sender: UIButton) {
        let shareVC = storyboard?.instantiateViewController(withIdentifier: "ShareViewController") as! ShareViewController
        if coupon != nil {
            shareVC.couponId = coupon![sender.tag].id!
        }
        displayContentController(content: shareVC)
        
    }
    
    @IBAction func printBtnAction(_ sender: UIButton) {
        let printVC = storyboard?.instantiateViewController(withIdentifier: "PrintViewController") as! PrintViewController
        printVC.couponItem = coupon?[sender.tag]
        displayContentController(content: printVC)
        
    }
    
    func displayContentController(content: UIViewController) {
        addChild(content)
        self.view.addSubview(content.view)
        content.didMove(toParent: self)
    }
}



/// - Author: Qazi Ammar Arshad.
extension CouponViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coupon?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "couponCell") as! CouponCell
        if let item = coupon?[indexPath.item] {
            cell.configCouponCell(item: item, indexPath: indexPath)
        }
        return cell
    }
}
//MARK: DIDSELECTCALL
extension CouponViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard  let urlStrring =  coupon?[indexPath.item].link else {print("No link found");return}
        if let url = URL(string: urlStrring) {
            UIApplication.shared.open(url)
        }
    }
}


extension CouponViewController {
    fileprivate func callApi (){
        MBProgressHUD.showAdded(to: self.view, animated: true)
        WebServices.URLResponse("http://api.shaku.it/coupons.php", method: .get, parameters: nil, withSuccess: { [weak self] (data) in
            
            guard let strongSelf = self else {return}
            let decoder = JSONDecoder()
            do{
                MBProgressHUD.hide(for: strongSelf.view , animated: true)
                let response = try decoder.decode(RootCoupon.self, from: data)
                //                print(response)
                if let strongSelf = self {
                    strongSelf.coupon = response.coupons
                    strongSelf.tableView.reloadData()
                }
            }catch let error{
                print(error.localizedDescription)
                MBProgressHUD.hide(for: strongSelf.view, animated: true)
            }
        }) { (error) in
            print(error)
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}
