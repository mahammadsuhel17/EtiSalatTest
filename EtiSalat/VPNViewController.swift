//
//  VPNViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/15/23.
//

import UIKit

class VPNViewController: UIViewController {
    var screenImage = UIImageView()
    var mainText = UILabel()
    var bodyText = UILabel()
    var installButton = CustomButton(hasBackground: true, title: "I agree", buttonType: .medium)
    
    let relativeContrains : CGFloat = 0.060

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
    }
    func configureScreenImage (){
        view.addSubview(screenImage)
        screenImage.translatesAutoresizingMaskIntoConstraints = false
        screenImage.image = UIImage(named: "vpnScreenImge")
        
        NSLayoutConstraint.activate([
            screenImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            screenImage.heightAnchor.constraint(equalToConstant: 300),
            screenImage.widthAnchor.constraint(equalToConstant: 300),
            screenImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 105)
        ])
    }
    
    func configureMainText (){
        view.addSubview(mainText)
        mainText.translatesAutoresizingMaskIntoConstraints = false
        mainText.text = "VPN Profile"
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
        bodyText.text = "Parental Control uses a VPN connection to keep your family safe from harmful websites. Please install the VPN profile in the next screens. When the VPN is running you will see a VPN icon on the device status bar. "
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
        view.addSubview(installButton)
        installButton.addTarget(self, action: #selector(handleInstall), for: .touchUpInside)
        NSLayoutConstraint.activate([
            installButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            installButton.heightAnchor.constraint(equalToConstant: 34),
//            installButton.widthAnchor.constraint(equalToConstant: 93),
            installButton.topAnchor.constraint(equalTo: bodyText.bottomAnchor, constant: 68)
        ])
    }
    
    @objc func handleInstall (){
       
        
    }


}
