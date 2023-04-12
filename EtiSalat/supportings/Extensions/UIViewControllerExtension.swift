//
//  UIViewControllerExtension.swift
//  Allot
//
//  Created by Mani Deepika J M on 3/16/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
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

//Show Custom Popup
extension UIViewController {
    func showCloseConfirmPopUp(buttonTitle: AlertActions,title: String,subTitle: String, style: AlertActionType ,confirmAction: @escaping() -> Void) {
        let yesAction = AlertAction(title: buttonTitle.text.localized(), image: nil, action: confirmAction, style: style)
        let alertView = AlertView(title: title, desc: subTitle, actions: [yesAction])
        alertView.show()
    }
}

//Atrributed text
extension UIViewController {
    func attributedLabelText(text1: String, text2: String) -> NSAttributedString {
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: RegularTextFontName, size: CGFloat(SmallTitleFontSize)), NSAttributedString.Key.foregroundColor : APPThemeColor.title]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: RegularTextFontName, size: CGFloat(SmallTitleFontSize)) as Any, NSAttributedString.Key.foregroundColor : APPThemeColor.link, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue] as [NSAttributedString.Key : Any]
        let str1 = NSMutableAttributedString(string: text1, attributes:attrs1 as [NSAttributedString.Key : Any])
        let str2 = NSMutableAttributedString(string: text2, attributes:attrs2 as [NSAttributedString.Key : Any])
        let str3 = NSMutableAttributedString(string: " ")
        return str1 + str2 + str3
    }
}
