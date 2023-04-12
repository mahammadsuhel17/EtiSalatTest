//
//  CustomButton.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/14/23.
//

import TinyConstraints

class CustomButton: UIButton {
    
    enum buttonType {
        case big
        case medium
        case small
    }
    
    init(hasBackground: Bool = false, title : String, buttonType:buttonType ){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(hasBackground ? UIColor.white : UIColor.black, for: .normal)
        layer.cornerRadius = 17
        self.backgroundColor = hasBackground ? APPThemeColor.buttonBackground : .clear
        titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        switch buttonType {
        case .big:
            self.width(300)
        case .medium:
            self.width(107)
        case .small:
            self.width(82)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
