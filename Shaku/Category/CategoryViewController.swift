//
//  CategoryViewController.swift
//  Shaku
//
//  Created by qazi ammar arshad on 2/9/19.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import UIKit
import MBProgressHUD

class CategoryViewController: UIViewController {

    fileprivate var category : [Category]?
    @IBOutlet weak fileprivate var tableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callApi()
    }
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categorycell") as! CatogoryCell
        if  let item = category?[indexPath.item]{
            cell.configCatogoryCell(item: item , indexPath: indexPath)
        }

        return cell
    }
    
    
}
extension CategoryViewController {
    fileprivate func callApi (){
        MBProgressHUD.showAdded(to: self.view, animated: true)
        WebServices.URLResponse("http://api.shaku.it/categories.php", method: .get, parameters: nil, withSuccess: { [weak self] (data) in
            
            guard let strongSelf = self else {return}
            let decoder = JSONDecoder()
            do{
                MBProgressHUD.hide(for: strongSelf.view , animated: true)
                let response = try decoder.decode(RootCategory.self, from: data)
                print(response)
                if let strongSelf = self {
                    strongSelf.category = response.categories
                    strongSelf.tableVIew.reloadData()
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
