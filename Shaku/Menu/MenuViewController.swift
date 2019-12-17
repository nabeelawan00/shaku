//
//  MenuViewController.swift
//  MakStores
//
//  Created by Ali Ahsan on 8/18/18.
//  Copyright © 2018 Half Tech. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet var nameLoginLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    
    var menuNameArr: Array = [String]()
    var iconImage:Array = [UIImage]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuNameArr = ["HOME", "COUPONS", "STORES", "ALL PRODUCT", "PROFILE", "SHARE", "LOGOUT"]
        iconImage = [UIImage(named: "Home")!,UIImage(named: "bag")!, UIImage(named: "shop")!, UIImage(named: "myaccount")!, UIImage(named: "saveditems")!, UIImage(named: "Help")!, UIImage(named: "setting")!]
        
       
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showUserName()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func showUserName() {
        
        if CustomUserDefaults.isUserDefaultEmpty() {
            nameLoginLbl.isHidden = true
        } else {
            nameLoginLbl.isHidden = false
            nameLoginLbl.text = UserDefaults.standard.string(forKey: UserDefaultsEnum.name.rawValue) ?? ""
            emailLbl.text = UserDefaults.standard.string(forKey: UserDefaultsEnum.email.rawValue) ?? ""
        }
    }
    
    
}
extension MenuViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if UserDefaults.standard.string(forKey: userDefaultProfile.first_name.rawValue) == nil {
//
//                return  6
//        }
        
        
              return menuNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        
        cell.iconImage.image = iconImage[indexPath.row]
        cell.nameLbl.text! = menuNameArr[indexPath.row]
        cell.separatorInset = UIEdgeInsets(top: 0, left: 1000, bottom: 0, right: 0);
        return cell
        
    }
    
    
    
}

extension MenuViewController : UITableViewDelegate {


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(menuNameArr[indexPath.row])

        self.revealViewController().revealToggle(animated: true)
        let homeViewController = self.revealViewController().frontViewController as! UINavigationController

        if menuNameArr[indexPath.row] ==  "HOME" {
            print("Home")

        } else if menuNameArr[indexPath.row] ==  "COUPONS" {

            let shopVC = storyboard?.instantiateViewController(withIdentifier: "CouponViewController")
            homeViewController.pushViewController(shopVC!, animated: true)


        } else if  menuNameArr[indexPath.row] ==  "STORES" {

                let bagVC = storyboard?.instantiateViewController(withIdentifier: "StoreViewController")
                homeViewController.pushViewController(bagVC!, animated: true)
        }
        else if menuNameArr[indexPath.row] == "ALL PRODUCT" {
            let profileVC = storyboard?.instantiateViewController(withIdentifier: "AllProductViewController")
            homeViewController.pushViewController(profileVC!,animated: true)

        }
        else if  menuNameArr[indexPath.row] == "PROFILE"  {

            let orderVC = storyboard?.instantiateViewController(withIdentifier: "ProfileVIewController")
            homeViewController.pushViewController(orderVC!, animated: true)
    }  else if menuNameArr[indexPath.row] == "SHARE" {

           let contctVC = storyboard?.instantiateViewController(withIdentifier: "ShareViewController")
            
             present(contctVC!, animated: true, completion: nil)
        }
        else if menuNameArr[indexPath.row] == "LOGOUT" {
            print("Logout")
//            clear the userdefaults.
            CustomUserDefaults.clearAllUserDefaults()
//            move to login screen.
            appDelegate?.selectRootController()

        } else {
            print("end else is running")
        }
             tableView.deselectRow(at: indexPath, animated: true)
    }
}




