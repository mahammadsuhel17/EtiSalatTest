//
//  CheckBox.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/14/23.
//

import UIKit

class CheckBox: UIView {
    
    private var isChecked = false
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .darkGray
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "square")
        return imageView
    }()
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
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 18),
            imageView.widthAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func toggle()-> Bool {
        self.isChecked = !isChecked
        if(isChecked){
            imageView.image = UIImage(systemName: "checkmark.square.fill")
            imageView.tintColor = .red
        } else {
            imageView.image = UIImage(systemName: "square")
            backgroundColor = .systemBackground
            imageView.tintColor = .darkGray
        }
        return isChecked
    }
}
