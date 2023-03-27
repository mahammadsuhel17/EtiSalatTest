//
//  CheckBox.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/14/23.
//

import TinyConstraints

class CheckBox: UIImageView {
    
    var isChecked = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        super.init(frame: .zero)
        configure()
    }
    
    func configure(){
        self.tintColor = .darkGray
        self.contentMode = .scaleAspectFit
        self.image = UIImage(systemName: "square")
        self.height(18)
        self.width(18)
    }
    
    func toggle()-> Bool {
        self.isChecked = !isChecked
        if(isChecked){
            self.image = UIImage(systemName: "checkmark.square.fill")
            self.tintColor = .red
        } else {
            self.image = UIImage(systemName: "square")
            backgroundColor = .systemBackground
            self.tintColor = .darkGray
        }
        return isChecked
    }
}
