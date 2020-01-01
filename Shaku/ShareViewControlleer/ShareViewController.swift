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
        
        let instagramURL = NSURL(string: "instagram://app")
        if UIApplication.shared.canOpenURL(instagramURL! as URL) {
            //Code
            UIApplication.shared.open(URL(string: instagramHooks)!)
            
        } else {
            //Showing message "Please install the Instagram application"
            UIApplication.shared.open(URL(string: "http://instagram.com/")!)
        }
        
    }
    
    @IBAction func whatsAppBtn(_ sender: UIButton) {
        
        // https://shaku.it/sharer.php?s=whatsapp&u=
        
        let whatsappHooks = "https://shaku.it/sharer.php?s=whatsapp&u=" + CustomUserDefaults.getUderId() + "&c=" + couponId
        
        if let urlString = whatsappHooks.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
            if let whatsappURL = URL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL) {
                    UIApplication.shared.openURL(whatsappURL)
                } else {
                    print("Install Whatsapp")
                }
            }
        }
        
    }
    
    @IBAction func faceboobBtn(_ sender: UIButton) {
        
        //        https://shaku.it/sharer.php?s=facebook&u=
        
        let facebookHooks = "https://shaku.it/sharer.php?s=facebook&u=" + CustomUserDefaults.getUderId() + "&c=" + couponId
        
        let shareContent = ShareLinkContent()
        shareContent.contentURL = URL.init(string: facebookHooks)! //your link
        //        shareContent.quote = "Text to be shared"
        ShareDialog(fromViewController: self, content: shareContent, delegate: self as! SharingDelegate).show()
        
        func sharer(_ sharer: Sharing, didCompleteWithResults results: [String : Any]) {
            if sharer.shareContent.pageID != nil {
                print("Share: Success")
            }
        }
        func sharer(_ sharer: Sharing, didFailWithError error: Error) {
            print("Share: Fail")
        }
        func sharerDidCancel(_ sharer: Sharing) {
            print("Share: Cancel")
        }
        
        //        let facebookURL = NSURL(string: "facebook://app")
        //        if UIApplication.shared.canOpenURL(facebookURL! as URL) {
        //            //Code
        //            UIApplication.shared.open(URL(string: facebookHooks)!)
        //
        //        } else {
        //            //Showing message "Please install the Instagram application"
        //            UIApplication.shared.open(URL(string: "http://facebook.com/")!)
        //        }
        
    }
    
}
