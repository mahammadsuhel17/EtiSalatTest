//
//  ButtonTheme.swift
//  Allot
//
//  Created by Mani Deepika J M on 3/29/23.
//

import UIKit
import TinyConstraints

enum ButtonTypeTheme {
    case enabled
    case disabled
}

class ButtonTheme: UIButton {
    var spinner = UIActivityIndicatorView()
    var buttonTheme: ButtonTypeTheme? {
        didSet {
            updateButtonTheme()
        }
    }
    var isLoading = false {
        didSet {
            // whenever `isLoading` state is changed, update the view
            updateViewLoaderUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLoaderView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLoaderView()
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLoaderView() {
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
        }
    
    func updateButtonTheme() {
        switch buttonTheme {
        case .enabled:
            self.setTitleColor(APPThemeColor.buttonTitle, for: [])
            self.backgroundColor = APPThemeColor.buttonBackground
            self.layer.cornerRadius = 17
        case .disabled:
            self.setTitleColor(APPThemeColor.disabledButtonTitle, for: [])
            self.backgroundColor = APPThemeColor.disabledButtonBackground
            self.layer.cornerRadius = 17
        case .none:
            print("something went wrong")
        }
    }
    func updateViewLoaderUI() {
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
