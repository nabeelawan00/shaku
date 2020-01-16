//
//  ShareViewController.swift
//  Shaku
//
//  Created by Bills on 04/08/2019.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import UIKit
import FBSDKShareKit

class ShareViewController: UIViewController {
    
    @IBOutlet var parentView: UIView!
    var couponId = ""
    var testVariable = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tapGesture()
        
        
        // Do any additional setup after loading the view.
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
    
    func tapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        self.parentView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer? = nil) {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    @IBAction func instagramBtn(_ sender: UIButton) {
        
        let instagramHooks = "https://shaku.it/sharer.php?s=instagram&u=" + CustomUserDefaults.getUderId() + "&c=" + couponId
        
        if let url = URL(string: instagramHooks) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func whatsAppBtn(_ sender: UIButton) {
        
        // https://shaku.it/sharer.php?s=whatsapp&u=
        
        let whatsappHooks = "https://shaku.it/sharer.php?s=whatsapp&u=" + CustomUserDefaults.getUderId() + "&c=" + couponId
        if let url = URL(string: whatsappHooks) {
            UIApplication.shared.open(url)
        }
        
    }
    
    @IBAction func faceboobBtn(_ sender: UIButton) {
        
        //        https://shaku.it/sharer.php?s=facebook&u=
        
        let facebookHooks = "https://shaku.it/sharer.php?s=facebook&u=" + CustomUserDefaults.getUderId() + "&c=" + couponId
        if let url = URL(string: facebookHooks) {
            UIApplication.shared.open(url)
        }
        
    }
    
}


