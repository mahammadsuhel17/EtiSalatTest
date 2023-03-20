//
//  CustomButton.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/14/23.
//

import UIKit

class CustomButton: UIButton {
    
    enum buttonType {
        case big
        case medium
        case small
    }
    
    init(hasBackground: Bool = false, title : String, buttonType:buttonType ){
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.setTitleColor(hasBackground ? UIColor.white : UIColor.black, for: .normal)
        layer.cornerRadius = 17
        self.backgroundColor = hasBackground ? UIColor(hexString: "#E00800") : .clear
        titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        switch buttonType {
        case .big:
            NSLayoutConstraint.activate([
                self.widthAnchor.constraint(equalToConstant: 133)
            ])
        case .medium:
            NSLayoutConstraint.activate([
                self.widthAnchor.constraint(equalToConstant: 107 )
            ])
        case .small:
            NSLayoutConstraint.activate([
                self.widthAnchor.constraint(equalToConstant: 82)
            ])
        }
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 35)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
