//
//  HomescreenViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/17/23.
//

import UIKit

class HomescreenViewController: UIViewController {
    var screenImage = UIImageView()
    var mainText = UILabel()
    var bodyText = UILabel()
    var permissionButton = UIButton()
    var buttonIcon = UIImageView()
    var buttonTitle = UILabel()
    var aboutButton = CustomButton(hasBackground: false, title: "About", buttonType: .small )
    var termsButton = CustomButton(hasBackground: false, title: "Privacy Terms", buttonType: .big )
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    func configureUI (){
        configureScreenImage()
        configureMainText()
        configureBodyText()
        configureButton()
        configureAboutButton()
        configureTermsButton()
    }
    
    func configureScreenImage (){
        view.addSubview(screenImage)
        screenImage.translatesAutoresizingMaskIntoConstraints = false
        screenImage.image = UIImage(named: "homeScreenImage")
        
        NSLayoutConstraint.activate([
            screenImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            screenImage.heightAnchor.constraint(equalToConstant: 230),
            screenImage.widthAnchor.constraint(equalToConstant: 190),
            screenImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 125)
        ])
    }
    func configureMainText (){
        view.addSubview(mainText)
        mainText.translatesAutoresizingMaskIntoConstraints = false
        mainText.text = "Parental Control"
        mainText.textAlignment = .center
        mainText.font = .systemFont(ofSize: 24, weight: .medium)
        
        NSLayoutConstraint.activate([
            mainText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainText.topAnchor.constraint(equalTo: screenImage.bottomAnchor, constant: 20),
            mainText.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainText.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureBodyText (){
        view.addSubview(bodyText)
        bodyText.translatesAutoresizingMaskIntoConstraints = false
        bodyText.text = "Protecting this device any place any time "
        bodyText.textAlignment = .center
        bodyText.font = .systemFont(ofSize: 16, weight: .regular)
        bodyText.numberOfLines = 0

        NSLayoutConstraint.activate([
            bodyText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bodyText.topAnchor.constraint(equalTo: mainText.bottomAnchor, constant: 20),
            bodyText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            bodyText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
    }
    func configureButton (){
        view.addSubview(permissionButton)
        permissionButton.translatesAutoresizingMaskIntoConstraints = false
        permissionButton.addTarget(self, action: #selector(handlePermission), for: .touchUpInside)
        permissionButton.layer.borderWidth = 1
        permissionButton.layer.cornerRadius = 20
    
        permissionButton.addSubview(buttonTitle)
        buttonTitle.translatesAutoresizingMaskIntoConstraints = false
        buttonTitle.text = "Permission Overview"
        buttonTitle.font = .systemFont(ofSize: 14, weight: .semibold)
        
        permissionButton.addSubview(buttonIcon)
        buttonIcon.translatesAutoresizingMaskIntoConstraints = false
        buttonIcon.image = UIImage(named: "permissionButtonIcon")
        
        NSLayoutConstraint.activate([
            permissionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            permissionButton.heightAnchor.constraint(equalToConstant: 40),
            permissionButton.widthAnchor.constraint(equalToConstant: 220),
            permissionButton.topAnchor.constraint(equalTo: bodyText.bottomAnchor, constant: 68),
            
            buttonTitle.centerYAnchor.constraint(equalTo: permissionButton.centerYAnchor),
            buttonTitle.leftAnchor.constraint(equalTo: buttonIcon.rightAnchor, constant: 10),
            
            buttonIcon.centerYAnchor.constraint(equalTo: permissionButton.centerYAnchor),
            buttonIcon.leftAnchor.constraint(equalTo: permissionButton.leftAnchor, constant: 16)
            
        ])
    }
    func configureAboutButton (){
        view.addSubview(aboutButton)
        aboutButton.translatesAutoresizingMaskIntoConstraints = false
        aboutButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        let attributedString = NSAttributedString(string: "About", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        aboutButton.setAttributedTitle(attributedString, for: .normal)
        
        aboutButton.addTarget(self, action: #selector(handelAbout), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            aboutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aboutButton.topAnchor.constraint(equalTo: permissionButton.bottomAnchor, constant: 20),
        ])
    }
    
    func configureTermsButton (){
        view.addSubview(termsButton)
        termsButton.translatesAutoresizingMaskIntoConstraints = false
        termsButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        let attributedString = NSAttributedString(string: "Privacy Terms", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        termsButton.setAttributedTitle(attributedString, for: .normal)
        termsButton.addTarget(self, action: #selector(handelTerms), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            termsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            termsButton.topAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 12),
        ])
    }
    
    
    @objc func handlePermission(){
        
    }
    
    @objc func handelAbout(){
    
    }
    
    @objc func handelTerms(){
    
    }
    


}
