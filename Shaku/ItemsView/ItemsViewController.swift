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

    @IBOutlet weak fileprivate var tableView: UITableView!
    fileprivate var couponHome : [CouponHome]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callApi()
    }
    

}

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return couponHome?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        if let item = couponHome?[indexPath.item]{
            cell.configItemCell(item: item, indexPath: indexPath)
        }
        return cell
    }
    
}

extension ItemsViewController {
    fileprivate func callApi (){
        MBProgressHUD.showAdded(to: self.view, animated: true)
        WebServices.URLResponse("http://api.shaku.it/home.php", method: .get, parameters: nil, withSuccess: { [weak self] (data) in
            
            guard let strongSelf = self else {return}
            let decoder = JSONDecoder()
            do{
                MBProgressHUD.hide(for: strongSelf.view , animated: true)
                let response = try decoder.decode(RootClass.self, from: data)
                print(response)
                if let strongSelf = self {
                    strongSelf.couponHome = response.coupons
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
