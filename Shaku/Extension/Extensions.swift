//
//  Extensions.swift
//  Shaku
//
//  Created by qazi ammar arshad on 7/3/19.
//  Copyright © 2019 Qazi Ammar Arshad. All rights reserved.
//

import Foundation

extension UIViewController {
    func showAlert(title: String = "Shaku", message: String ) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}
