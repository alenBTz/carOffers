//
//  AlertManager.swift
//  sixtRentACar
//
//  Created by Alen Basic on 9/26/17.
//  Copyright © 2017 alenbasic. All rights reserved.
//

import Foundation
import UIKit

class AlertManager {
    static let sharedInstance = AlertManager()
    
    func showAlert(message: String) {
        let optionMenu = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "ok", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        optionMenu.addAction(confirmAction)
        UIApplication.shared.keyWindow?.rootViewController!.present(optionMenu, animated: true, completion: nil)
    }
    
}
