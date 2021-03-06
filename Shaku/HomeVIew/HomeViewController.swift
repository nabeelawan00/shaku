//
//  HomeViewController.swift
//  Shaku
//
//  Created by qazi ammar arshad on 2/7/19.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import UIKit
import Alamofire
import CarbonKit

class HomeViewController: UIViewController {
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var coupon: RootCoupon?
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        carbonKit()
        
        swReavelController()
        
    }
    
    /// - Author: Qazi Ammar Arshad
    func carbonKit() {
        
        let items = [" HOME ",  " CATEGORIES  "]
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
        carbonTabSwipeNavigation.setTabExtraWidth(70)
        carbonTabSwipeNavigation.setNormalColor(UIColor.gray)
        carbonTabSwipeNavigation.setSelectedColor(UIColor.black)
        carbonTabSwipeNavigation.setTabBarHeight(40)
        carbonTabSwipeNavigation.setIndicatorHeight(1)
        carbonTabSwipeNavigation.setIndicatorColor(UIColor.black)
    }
    
    func swReavelController() {
        menuButton.target = self.revealViewController()
        menuButton.action = #selector(revealViewController().revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        self.revealViewController().rearViewRevealWidth = 280
        self.revealViewController().rearViewRevealDisplacement = 0
        self.revealViewController()?.frontViewController.viewWillDisappear(true)
    }
   
}

extension HomeViewController : CarbonTabSwipeNavigationDelegate {
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        if index == 0 {
            let screen = self.storyboard?.instantiateViewController(withIdentifier: "ItemsViewController") as!  ItemsViewController
            
            return screen
            
        } else {
            let screen1 = self.storyboard?.instantiateViewController(withIdentifier: "CategoriesViewController")
            return screen1!
        }
    }
}

// Custom function extension
extension HomeViewController {
    
    //    call api on when screen appears.
    
}
