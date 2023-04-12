//
//  loaderButton.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 4/4/23.
//

import UIKit
import TinyConstraints

class loaderButton: UIButton {

    // 2
       var spinner = UIActivityIndicatorView()
       // 3
       var isLoading = false {
           didSet {
               // whenever `isLoading` state is changed, update the view
               updateView()
           }
       }
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           // 4
           setupView()
       }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
           setupView()
       }
    
    func setupView() {
            spinner.hidesWhenStopped = true
            // to change spinner color
            spinner.color = APPThemeColor.buttonBackground
            // default style
            spinner.style = .medium
            
            // add as button subview
            addSubview(spinner)
        
            // set constraints to always in the middle of button
            spinner.centerX(to: self)
            spinner.centerY(to: self)
        
//            spinner.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//                spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor)
//            ])
        }
    
    func updateView() {
            if isLoading {
                spinner.startAnimating()
                titleLabel?.alpha = 0
                imageView?.alpha = 0
                // to prevent multiple click while in process
                isEnabled = false
            } else {
                spinner.stopAnimating()
                titleLabel?.alpha = 1
                imageView?.alpha = 0
                isEnabled = true
            }
        }

}
