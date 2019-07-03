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
            callAPi()
            
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
    func callAPi() {
        
        let completeUrl = URL(string: WebServices.skakuBaseURL + APIEnum.auth.rawValue)
        let paremeters = ["email": emailTF.text!,
                          "password": passwordTF.text!]
        
        WebServices.callApiWith(url: completeUrl!, method: .post, parameters: paremeters, withSucces: { (responseObject) in
            print(responseObject)
        }) { (error) in
            self.showAlert(title: "Shaku", message: error)
        }
        
    }
    
    
}

//google extension
extension LoginViewController: GIDSignInUIDelegate {
    // Present a view that prompts the user to sign in with Google
    
}
