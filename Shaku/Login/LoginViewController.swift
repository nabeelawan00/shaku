//
//  LoginViewController.swift
//  Shaku
//
//  Created by qazi ammar arshad on 2/18/19.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {

    let delegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.uiDelegate = self

        // Do any additional setup after loading the view.
    }
    @IBAction func gmailSignBtn(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.signIn()
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

//google extension
extension LoginViewController: GIDSignInUIDelegate {
    // Present a view that prompts the user to sign in with Google
    
}
