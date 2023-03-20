//
//  SuccessViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/17/23.
//

import UIKit

class SuccessViewController: UIViewController {

    var screenImage = UIImageView()
    var mainText = UILabel()
    var bodyText = UILabel()
    var Button = CustomButton(hasBackground: true, title: "Done", buttonType: .big )

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
        screenImage.image = UIImage(named: "successScreenImge")
        
        NSLayoutConstraint.activate([
            screenImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            screenImage.heightAnchor.constraint(equalToConstant: 260),
            screenImage.widthAnchor.constraint(equalToConstant: 260),
            screenImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 165)
        ])
    }
    func configureMainText (){
        view.addSubview(mainText)
        mainText.translatesAutoresizingMaskIntoConstraints = false
        mainText.text = "Congratulations, you made it!"
        mainText.textAlignment = .center
        mainText.font = .systemFont(ofSize: 24, weight: .medium)
        
        NSLayoutConstraint.activate([
            mainText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainText.topAnchor.constraint(equalTo: screenImage.bottomAnchor, constant: 25),
            mainText.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainText.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureBodyText (){
        view.addSubview(bodyText)
        bodyText.translatesAutoresizingMaskIntoConstraints = false
        bodyText.text = "This device is now protected."
        bodyText.textAlignment = .center
        bodyText.font = .systemFont(ofSize: 16, weight: .regular)
        bodyText.numberOfLines = 0

        NSLayoutConstraint.activate([
            bodyText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bodyText.topAnchor.constraint(equalTo: mainText.bottomAnchor, constant: 25),
            bodyText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            bodyText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
    }
    
    func configureButton (){
        view.addSubview(Button)
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        Button.addTarget(self, action: #selector(handelButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Button.topAnchor.constraint(equalTo: bodyText.bottomAnchor, constant: 30),
            ])
    }
            
            @objc func handelButton(){
            
            }
}
