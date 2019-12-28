//
//  ItemsViewController.swift
//  Shaku
//
//  Created by qazi ammar arshad on 2/8/19.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import UIKit
import MBProgressHUD

class ItemsViewController: UIViewController {
    
    let appdelegat = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak fileprivate var tableView: UITableView!
    var homeModel: RootCoupon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callApi()
    }
}

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeModel?.coupons?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        if let item = homeModel?.coupons?[indexPath.item]{
            cell.configItemCell(item: item, indexPath: indexPath)
        }
        
        
        cell.callBack = {[weak self] in
            guard let self = self else {return}
            guard let coupenId = self.homeModel?.coupons?[indexPath.item].id else {print("no coupen id");return}
            self.openSahreVc(coupenID: coupenId)
        }
        
        return cell
    }
    
    
    private func openSahreVc(coupenID  : String){
        let shareVC = storyboard?.instantiateViewController(withIdentifier: "ShareViewController") as! ShareViewController
        
        if homeModel?.coupons != nil {
            shareVC.couponId = coupenID
        }
        displayContentController(content: shareVC)
    }
    func displayContentController(content: UIViewController) {
        addChild(content)
        self.view.addSubview(content.view)
        content.didMove(toParent: self)
    }
}
//MARK: DIDSELECTCALL
extension ItemsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard  let urlStrring =  homeModel?.coupons?[indexPath.item].link else {print("No link found");return}
        if let url = URL(string: urlStrring) {
            UIApplication.shared.open(url)
        }
    }
    
}
// Custom fucntio extension
extension ItemsViewController {
    
    fileprivate func callApi (){
        
//        MBProgressHUD.showAdded(to: self.view, animated: true)
        let completeUrl =  WebServices.skakuBaseURL + APIEnum.coupons.rawValue
        
        WebServices.URLResponse(completeUrl, method: .post, parameters: nil, withSuccess: { [weak self] (data) in
//            MBProgressHUD.hide(for: self!.view, animated: true)
            let decoder = JSONDecoder()
            do{
                let response = try decoder.decode(RootCoupon.self, from: data)
                print(response)
                if let strongSelf = self {
                    strongSelf.homeModel = response
                    strongSelf.tableView.reloadData()
                }
                
            }catch let error{
                print(error.localizedDescription)
                
            }
        }) { (error) in
//            MBProgressHUD.hide(for: self.view, animated: true)
            print(error)
            self.showAlert(message: error)
        }
    }
}
