//
//  UITextFieldExtension.swift
//  Allot
//
//  Created by Mani Deepika J M on 3/16/23.
//

import Foundation
import UIKit

extension UITextField {
    //add bottom border for textfield
    func addBottomBorderWithColor(color: UIColor){
        self.borderStyle = UITextField.BorderStyle.none
        self.backgroundColor = UIColor.clear
        let width: CGFloat = 3.0
        let borderLine = UIView(frame: CGRect(x: 0, y: self.frame.height - width, width: self.frame.width, height: 1))
        borderLine.backgroundColor = color
        borderLine.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        self.addSubview(borderLine)
    }
}
