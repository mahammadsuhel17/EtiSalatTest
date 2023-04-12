//
//  CustomTextFields.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/28/23.
//

import TinyConstraints

class CustomTextFields: UITextField {
    
    init() {
        super.init(frame: CGRect.zero)
        setupUnderlineTextField()
    }

    func setupUnderlineTextField(){
        let bottomLine = UIView()
        bottomLine.backgroundColor = .black
        bottomLine.layer.borderWidth = 1
        bottomLine.height(1)
//        bottomLine.width(ScreenSize.screenSize.width - 35)
        self.addSubview(bottomLine)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
