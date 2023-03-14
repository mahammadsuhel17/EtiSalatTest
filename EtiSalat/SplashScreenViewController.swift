//
//  SplashScreenViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/14/23.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    var logoView = UIImageView()
    var bottomText = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    func configureUI (){
        configureLogo()
        configureBottomText()
    }
    
    func configureLogo (){
        view.addSubview(logoView)
        logoView.image = UIImage(named: "logo")
        logoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 45),
            logoView.widthAnchor.constraint(equalToConstant: 155)
        ])
    }
    
    func configureBottomText (){
        view.addSubview(bottomText)
        bottomText.translatesAutoresizingMaskIntoConstraints = false
        bottomText.text = "Child Security App"
        bottomText.textAlignment = .center
        NSLayoutConstraint.activate([
            bottomText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -65),
            bottomText.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomText.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
        
//        gotoWelcomeScreen()
        
    }
    
    

}
