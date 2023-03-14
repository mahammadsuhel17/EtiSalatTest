//
//  CustomButton.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/14/23.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(backgroundcolor: UIColor , title : String, titleColor: UIColor){
        super.init(frame: .zero)
        configuration = .filled()
        configuration?.baseBackgroundColor = backgroundcolor
        configuration?.baseForegroundColor = titleColor
        configuration?.title = title
        configuration?.cornerStyle = .capsule
        configure()
    }
    func configure(){
        titleLabel?.font = .systemFont(ofSize: 20, weight:.bold)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
