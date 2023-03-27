//
//  FileUIViewControllerExtension.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/27/23.
//

import Foundation
import UIKit

extension UIViewController {
    //MARK:- dismiss keyboard
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK:- Alert
    func showAlert(withTitle title: String, withMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK".localized(), style: .default, handler: { action in
        })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}

extension UIViewController {
    func showCloseConfirmPopUp(buttonTitle: AlertActions,title: String,subTitle: String, style: AlertActionType ,confirmAction: @escaping() -> Void) {
        let yesAction = AlertAction(title: buttonTitle.text.localized(), image: nil, action: confirmAction, style: style)
        let alertView = AlertView(title: title, desc: subTitle, actions: [yesAction])
        alertView.show()
    }
}
