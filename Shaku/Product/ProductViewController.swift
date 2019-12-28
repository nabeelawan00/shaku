//
//  ProductViewController.swift
//  Shaku
//
//  Created by Ali Ahsan on 2/13/19.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import UIKit
import MBProgressHUD
import SDWebImage

class ProductViewController: UIViewController {
    
    var productId = ""
    var product_api_response: Product_Api?
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        callApi()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product_api_response?.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell")  as!
        ProductTableViewCell
        
        let product = product_api_response?.products?[indexPath.row]
        cell.productName.text = product?.categoryname
        cell.NewPrice.text = product?.price
        let image_url = URL(string: WebServices.imageBaseURL + (product?.image ?? ""))
        cell.productImageView?.sd_setImage(with: image_url, completed: nil)
        
        return cell
    }
    
}

extension ProductViewController {
    
    func callApi (){
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let completeURL = WebServices.skakuBaseURL + APIEnum.product.rawValue
        let parameters = ["cate": productId]
        
        WebServices.URLResponse(completeURL, method: .post, parameters: parameters, withSuccess: { [weak self] (data) in
            
            guard let strongSelf = self else {return}
            let decoder = JSONDecoder()
            do{
                MBProgressHUD.hide(for: strongSelf.view , animated: true)
                let response = try decoder.decode(Product_Api.self, from: data)
                
                if let strongSelf = self {
                    strongSelf.product_api_response = response
                    strongSelf.productTableView.reloadData()
                }
            }catch let error{
                print(error.localizedDescription)
                MBProgressHUD.hide(for: strongSelf.view, animated: true)
            }
        }) { (error) in
            self.showAlert(title: "Shaku", message: error)
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    
}
