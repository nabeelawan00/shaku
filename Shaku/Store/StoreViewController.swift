//
//  StoreViewController.swift
//  Shaku
//
//  Created by Ali Ahsan on 2/14/19.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import UIKit
import MBProgressHUD

class StoreViewController: UIViewController {
    
    fileprivate var store : [Store]?
    @IBOutlet weak fileprivate var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callApi()
    }
    
}


extension StoreViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return store?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCollectionViewCell", for: indexPath) as! StoreCollectionViewCell
        if let item = store?[indexPath.item] {
            cell.configStoreCell(item: item, indexPath: indexPath)
        }
        
        return cell
    }
    
}

extension StoreViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: (collectionViewWidth / 2) - 8 , height: collectionViewWidth/1.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
extension StoreViewController {
    fileprivate func callApi (){
        MBProgressHUD.showAdded(to: self.view, animated: true)
        WebServices.URLResponse("http://api.shaku.it/stores.php", method: .get, parameters: nil, withSuccess: { [weak self] (data) in
            
            guard let strongSelf = self else {return}
            let decoder = JSONDecoder()
            do{
                MBProgressHUD.hide(for: strongSelf.view , animated: true)
                let response = try decoder.decode(RootStore.self, from: data)
                print(response)
                if let strongSelf = self {
                    strongSelf.store = response.stores
                    strongSelf.collectionView.reloadData()
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
