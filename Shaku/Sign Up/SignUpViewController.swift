//
//  SignUpViewController.swift
//  Shaku
//
//  Created by qazi ammar arshad on 2/18/19.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTf: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func signUpBtn(_ sender: Any) {
//        First check the fields are not empty
        if isfieldsAreEmptry() {
            showAlert(message: "Plesase fill all the fields")
//            text fields condition function  like limit, correct email etc
            
        } else {
//            call api to send data on server
            callAPi()
        }
    }
}

// Custom Function Extension
extension SignUpViewController {
    
//    this function return true if any text fileds is empty.
    func isfieldsAreEmptry() -> Bool {
        if firstNameTF.text!.isEmpty || lastNameTf.text!.isEmpty || emailTF.text!.isEmpty || mobileTF.text!.isEmpty || passwordTF.text!.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    func isEmailCorrect(email: String) -> Bool {
        return true
    }
    
    func isPasswrodCorrect(password: String) -> Bool {
        return true
    }
    
    //    send data to server. calling API.
    func callAPi() {
        
        self.appdelegate.showActivityIndicatory(uiView: self.view)
        
        let completeUrl = URL(string: WebServices.skakuBaseURL + APIEnum.signup.rawValue)
        
        let paremeters = ["email": emailTF.text!,
                          "firstname": firstNameTF.text!,
                          "lastname": lastNameTf.text!,
                          "mobileno": mobileTF.text!,
                          "password": passwordTF.text!]
        
        WebServices.callApiWith(url: completeUrl!, method: .post, parameters: paremeters, withSucces: { (responseObject) in
//            same login model can be use here
            let signUpModel = LoginModel(response: responseObject)
            if signUpModel.status == "true" {
//                self.movetoNextScreen()
                LoginViewController().callAPi(email: self.emailTF.text!, password: self.passwordTF.text!)
            } else {
                //                error message.
                self.showAlert(message: signUpModel.message)
            }
            self.appdelegate.hideActivityIndicatory()

        }) { (error) in
            self.appdelegate.hideActivityIndicatory()
            self.showAlert(message: error)
        }
    }
    
    //    save values to user Defaults.
//    func saveUserDefault(loginData: LoginModel) {
//        UserDefaults.standard.set(loginData.email, forKey: UserDefaultsEnum.email.rawValue)
//        UserDefaults.standard.set(loginData.mobileno, forKey: UserDefaultsEnum.mobileno.rawValue)
//        UserDefaults.standard.set(loginData.name, forKey: UserDefaultsEnum.name.rawValue)
//        UserDefaults.standard.set(loginData.userid, forKey: UserDefaultsEnum.userid.rawValue)
//    }
    
//    func movetoNextScreen() {
//        //        changing root view controller of appliction after login.
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SWRevealViewController")
//        UIApplication.shared.keyWindow?.rootViewController = viewController
//    }
    
    
}
