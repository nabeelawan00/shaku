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
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.uiDelegate = self

        // Do any additional setup after loading the view.
    }
    @IBAction func gmailSignBtn(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        
        if checkFieldsAreEmpty() {
            self.showAlert(title: "Shaku", message: "Please fill all fields")
        } else {
//            email and password check.
//            fildes are not empty so send the data to server.
//            make the server request and send data to senrver.
            callAPi(email: nil, password: nil)
        }
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

// Custom Function Extension.
extension LoginViewController {
    
//    function check that is fields are empty return true is fields are empty.
    func checkFieldsAreEmpty() -> Bool {
        if emailTF.text!.isEmpty || passwordTF.text!.isEmpty {
            return true
        }
        return false
    }
    func isEmailCorrect(email: String) -> Bool {
        
        return true
    }
    
    func isPasswrodCorrect(password: String) -> Bool {
        
        return true
    }
//    send data to server. calling API.
//    this api is work for both login and sigup.
    func callAPi(email: String?, password: String?) {
        
        self.delegate.showActivityIndicatory(uiView: self.view)
        let completeUrl = URL(string: WebServices.skakuBaseURL + APIEnum.auth.rawValue)
        var paremeters = ["":""]
        if email != nil {
             paremeters = ["email": email!,
                           "password": password!]
        } else {
             paremeters = ["email": emailTF.text!,
                           "password": passwordTF.text!]
        }
        
        WebServices.callApiWith(url: completeUrl!, method: .post, parameters: paremeters, withSucces: { (responseObject) in
            let login = LoginModel(response: responseObject)
            if login.status == "true" {
                CustomUserDefaults.saveUserDefault(with: login)
                self.movetoNextScreen()
            } else {
//                error message.
                self.showAlert(message: login.message)
            }
            self.delegate.hideActivityIndicatory()
            
        }) { (error) in
            self.delegate.hideActivityIndicatory()
            self.showAlert(title: "Shaku", message: error)
        }
    }
    
    func movetoNextScreen() {
//        changing root view controller of appliction after login.
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SWRevealViewController")
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
}

//google extension
extension LoginViewController: GIDSignInUIDelegate {
    // Present a view that prompts the user to sign in with Google
    
}
