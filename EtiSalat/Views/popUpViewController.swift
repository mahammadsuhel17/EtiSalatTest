//
//  popUpViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/17/23.
//

import UIKit

class popUpViewController: UIViewController {
    var alertView = UIView()
    var popUpTitle = UILabel()
    var subTitle = UILabel()
    var buttonview1 = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    func configureUI(){
        view.backgroundColor = .clear
        view.backgroundColor = .black.withAlphaComponent(0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.isHidden = true
       
        view.addSubview(alertView)
        alertView.backgroundColor = .systemBackground
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.layer.cornerRadius = 12
        
        view.addSubview(popUpTitle)
        popUpTitle.translatesAutoresizingMaskIntoConstraints = false
        popUpTitle.font = .systemFont(ofSize: 22, weight: .semibold)
        
        view.addSubview(subTitle)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.font = .systemFont(ofSize: 12, weight: .regular)
        subTitle.numberOfLines = 0
        
        view.addSubview(buttonview1)
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
       view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
       view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
       view.heightAnchor.constraint(equalTo: view.heightAnchor),
       view.widthAnchor.constraint(equalTo: view.widthAnchor),
          
          alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
          alertView.widthAnchor.constraint(equalToConstant: 284),
          
       popUpTitle.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 26),
       popUpTitle.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 34),
       popUpTitle.leftAnchor.constraint(equalTo: alertView.leftAnchor, constant: 26),
       popUpTitle.rightAnchor.constraint(equalTo: alertView.rightAnchor, constant: -26),
          
          subTitle.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 26),
          subTitle.topAnchor.constraint(equalTo: popUpTitle.bottomAnchor, constant: 29),
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
    
//    func handleShow(){
//        view.isHidden = false
//    }
//
//    func handleHide(){
//        view.isHidden = true
//    }

}
