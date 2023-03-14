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
        imageView.isHidden = true
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "checkmark")
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
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.secondaryLabel.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 14),
            imageView.widthAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    func toggle(){
        self.isChecked = !isChecked
        if(isChecked){
            imageView.isHidden = false
            backgroundColor = .red
            layer.borderColor = nil
        } else {
            imageView.isHidden = true
            backgroundColor = .systemBackground
        }
    }
}
