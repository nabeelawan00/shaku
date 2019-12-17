//
//  CustomUserDefaults.swift
//  Shaku
//
//  Created by Bills on 04/08/2019.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import Foundation
class CustomUserDefaults {
    
   class func isUserDefaultEmpty() -> Bool {
        if UserDefaults.standard.string(forKey: UserDefaultsEnum.userid.rawValue) != nil {
            return false
        } else {
            return true
        }
    }
    
    class func saveUserDefault(with loginData: LoginModel) {
        UserDefaults.standard.set(loginData.email, forKey: UserDefaultsEnum.email.rawValue)
        UserDefaults.standard.set(loginData.mobileno, forKey: UserDefaultsEnum.mobileno.rawValue)
        UserDefaults.standard.set(loginData.name, forKey: UserDefaultsEnum.name.rawValue)
        UserDefaults.standard.set(loginData.userid, forKey: UserDefaultsEnum.userid.rawValue)
    }
    
    class func updateUserDefaults(name: String, email: String, phone: String) {
        UserDefaults.standard.set(email, forKey: UserDefaultsEnum.email.rawValue)
        UserDefaults.standard.set(phone, forKey: UserDefaultsEnum.mobileno.rawValue)
        UserDefaults.standard.set(name, forKey: UserDefaultsEnum.name.rawValue)
    }
    
    class func getUderId() -> String {
        let userId = UserDefaults.standard.string(forKey: UserDefaultsEnum.userid.rawValue) ?? ""
        return userId
    }
    
    class func clearAllUserDefaults() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsEnum.userid.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultsEnum.email.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultsEnum.name.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultsEnum.mobileno.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    
}
