//
//  borderBottomWidth.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/28/23.
//

import Foundation
import UIKit

extension UIView {
    func addBottomBorderWidthWithColor(color: UIColor, width: CGFloat){
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x:0, y: self.frame.size.height + 30, width: UIScreen.main.bounds.width - 35, height: width)
        bottomBorder.backgroundColor = color.cgColor
        self.layer.addSublayer(bottomBorder)
    }
}
