//
//  ProfileViewController.swift
//  Shaku
//
//  Created by Bills on 04/08/2019.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameLbl: UITextField!
    @IBOutlet weak var phoneLbl: UITextField!
    @IBOutlet weak var emailLbl: UITextField!
    
    var nameBeforChange = ""
    var phoneBeforChange = ""
    var emailBeforChage = ""

    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        getUserDefault()
        
    }
    
    @IBAction func updateAction(_ sender: UIButton) {
        if isDataChageBeforCallingApi() {
            // call data chage
            callAPi()
        } else {
//            no data is change, No API is called.
            self.showAlert(message: "Please Update your Information")
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

/// Author:- Qazi Ammar Arshad.
// Custom Function extension.


extension ProfileViewController {
    
    func getUserDefault() {
        nameLbl.text = UserDefaults.standard.string(forKey: UserDefaultsEnum.name.rawValue) ?? ""
        emailLbl.text = UserDefaults.standard.string(forKey: UserDefaultsEnum.email.rawValue) ?? ""
        phoneLbl.text = UserDefaults.standard.string(forKey: UserDefaultsEnum.mobileno.rawValue) ?? ""
        nameBeforChange = UserDefaults.standard.string(forKey: UserDefaultsEnum.name.rawValue) ?? ""
        emailBeforChage = UserDefaults.standard.string(forKey: UserDefaultsEnum.email.rawValue) ?? ""
        phoneBeforChange = UserDefaults.standard.string(forKey: UserDefaultsEnum.mobileno.rawValue) ?? ""
    }
    
    func isDataChageBeforCallingApi() -> Bool {
        if nameLbl.text != nameBeforChange || emailLbl.text != emailBeforChage || phoneBeforChange != phoneLbl.text {
            return true
        }
        return false
    }
    
    func updateUserDefaults() {
        CustomUserDefaults.updateUserDefaults(name: nameLbl.text ?? "", email: emailLbl.text ?? "", phone: phoneLbl.text ?? "")
        nameBeforChange = UserDefaults.standard.string(forKey: UserDefaultsEnum.name.rawValue) ?? ""
        emailBeforChage = UserDefaults.standard.string(forKey: UserDefaultsEnum.email.rawValue) ?? ""
        phoneBeforChange = UserDefaults.standard.string(forKey: UserDefaultsEnum.mobileno.rawValue) ?? ""
    }
    
    
    func callAPi() {
        
        self.delegate.showActivityIndicatory(uiView: self.view)
        let completeUrl = URL(string: WebServices.skakuBaseURL + APIEnum.update.rawValue)
        var paremeters = ["":""]
    
            paremeters = ["email": emailLbl.text!,
                          "name": nameLbl.text!,
                          "mobileno": phoneLbl.text!,
                          "userID": CustomUserDefaults.getUderId()
        ]
   
        WebServices.callApiWith(url: completeUrl!, method: .post, parameters: paremeters, withSucces: { (responseObject) in
            
            let jsonResponse = JSON(responseObject)
            if jsonResponse["status"].stringValue  == "true" {
                self.showAlert(message: "Data Updated Sucessfully")
                self.updateUserDefaults()
            } else {
                self.showAlert(message: "Error while Updating Data")
            }
            self.delegate.hideActivityIndicatory()
            
        }) { (error) in
            self.delegate.hideActivityIndicatory()
            self.showAlert(title: "Shaku", message: error)
        }
    }
    
    
}
