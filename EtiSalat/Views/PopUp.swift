//
//  PopUp.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/15/23.
//

import UIKit

class PopUp: UIView {
    var alertView = UIView()
    var title = UILabel()
    var subTitle = UILabel()
    var buttonview1 = UIButton()
    var buttonview2 = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        super.init(frame: .zero)
        
//        buttonview1.configuration?.title = buttonTitle
       
        configureUI()
    }
    
    func configureUI(){
       self.backgroundColor = .clear
       self.backgroundColor = .black.withAlphaComponent(0.6)
       self.translatesAutoresizingMaskIntoConstraints = false
       self.isHidden = true
       
        self.addSubview(alertView)
        alertView.backgroundColor = .systemBackground
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.layer.cornerRadius = 12
        
        self.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 22, weight: .semibold)
        
        self.addSubview(subTitle)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.font = .systemFont(ofSize: 12, weight: .regular)
        subTitle.numberOfLines = 0
        
        self.addSubview(buttonview1)
        buttonview1.translatesAutoresizingMaskIntoConstraints = false
        buttonview1.configuration = .filled()
        buttonview1.configuration?.baseBackgroundColor = .gray
        buttonview1.configuration?.baseForegroundColor = .white
        buttonview1.configuration?.cornerStyle = .capsule
        buttonview1.configuration?.title = "ok"
        
//        self.addSubview(buttonview2)
//        buttonview2.translatesAutoresizingMaskIntoConstraints = false
//        buttonview2.configuration = .filled()
//        buttonview2.configuration?.baseBackgroundColor = .gray
//        buttonview2.configuration?.baseForegroundColor = .white
//        buttonview2.configuration?.cornerStyle = .capsule
//        buttonview2.configuration?.title = "cancel"
        
        
        NSLayoutConstraint.activate([
          self.centerXAnchor.constraint(equalTo: self.centerXAnchor),
          self.centerYAnchor.constraint(equalTo: self.centerYAnchor),
          self.heightAnchor.constraint(equalTo: self.heightAnchor),
          self.widthAnchor.constraint(equalTo: self.widthAnchor),
          
          alertView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
          alertView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
          alertView.widthAnchor.constraint(equalToConstant: 284),
          
          title.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 26),
          title.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 34),
          title.leftAnchor.constraint(equalTo: alertView.leftAnchor, constant: 26),
          title.rightAnchor.constraint(equalTo: alertView.rightAnchor, constant: -26),
          
          subTitle.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 26),
          subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 29),
          subTitle.leftAnchor.constraint(equalTo: alertView.leftAnchor, constant: 26),
          subTitle.rightAnchor.constraint(equalTo: alertView.rightAnchor, constant: -26),
          
          buttonview1.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -26),
          buttonview1.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 19),
          buttonview1.heightAnchor.constraint(equalToConstant: 26),
          buttonview1.widthAnchor.constraint(equalToConstant: 64),
          
//          buttonview2.rightAnchor.constraint(equalTo: buttonview1.leftAnchor, constant: -26),
//          buttonview2.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 19),
//          buttonview2.heightAnchor.constraint(equalToConstant: 26),
//          buttonview2.widthAnchor.constraint(equalToConstant: 64)
          
          
        ])
    }
    
    func handleShow(){
        self.isHidden = false
    }
    
    func handleHide(){
        self.isHidden = true
    }

}
