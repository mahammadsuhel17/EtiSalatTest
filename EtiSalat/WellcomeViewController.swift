//
//  WellcomeViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/14/23.
//

import UIKit

class WellcomeViewController: UIViewController {

    var screenImage = UIImageView()
    var welcomeText = UILabel()
    var bodyText = UILabel()
    var agreeButton = CustomButton(backgroundcolor: .red, title: "I agree", titleColor: .white)
    var checkBox = CheckBox()
    var termsText = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    func configureUI (){
        configureScreenImage()
        configureWelcomeText()
        configureBodyText()
        configureAgreeButoon()
        configureCheckBox()
        configureTermsText()
    }
    
    func configureScreenImage (){
        view.addSubview(screenImage)
        screenImage.translatesAutoresizingMaskIntoConstraints = false
        screenImage.image = UIImage(named: "WelcomeScreenImage")
        
        NSLayoutConstraint.activate([
            screenImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            screenImage.heightAnchor.constraint(equalToConstant: 300),
            screenImage.widthAnchor.constraint(equalToConstant: 300),
            screenImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 105)
        ])
    }
    
    func configureWelcomeText (){
        view.addSubview(welcomeText)
        welcomeText.translatesAutoresizingMaskIntoConstraints = false
        welcomeText.text = "Welcome"
        welcomeText.textAlignment = .center
        welcomeText.font = .systemFont(ofSize: 24, weight: .medium)
        
        NSLayoutConstraint.activate([
            welcomeText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeText.topAnchor.constraint(equalTo: screenImage.bottomAnchor, constant: 20),
            welcomeText.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            welcomeText.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureBodyText (){
        view.addSubview(bodyText)
        bodyText.translatesAutoresizingMaskIntoConstraints = false
        bodyText.text = "Parental Control is developed to keep your family safe from screen addiction and harmful Internet content."
        bodyText.textAlignment = .center
        bodyText.font = .systemFont(ofSize: 16, weight: .regular)
        bodyText.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            bodyText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bodyText.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 20),
            bodyText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            bodyText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
    }
    func configureCheckBox (){
        view.addSubview(checkBox)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleCheck))
        checkBox.addGestureRecognizer(gesture)
        NSLayoutConstraint.activate([
            checkBox.heightAnchor.constraint(equalToConstant: 18),
            checkBox.widthAnchor.constraint(equalToConstant: 18),
            checkBox.topAnchor.constraint(equalTo: bodyText.bottomAnchor, constant: 16),
            checkBox.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16)
        ])
    }
    
   @objc func handleCheck (){
       checkBox.toggle()
    }
    
    func configureTermsText (){
        view.addSubview(termsText)
        termsText.translatesAutoresizingMaskIntoConstraints = false
        termsText.textAlignment = .left
        termsText.textColor = UIColor.blue
        termsText.font = .systemFont(ofSize: 12, weight: .regular)
        termsText.numberOfLines = 0
        
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "I hereby agree to the License Agreement and Privacy Terms", attributes: underlineAttribute)
        termsText.attributedText = underlineAttributedString
        
        NSLayoutConstraint.activate([
            termsText.topAnchor.constraint(equalTo: bodyText.bottomAnchor, constant: 16),
            termsText.leftAnchor.constraint(equalTo: checkBox.rightAnchor, constant: 10),
            termsText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
    }
    
    
    
    func configureAgreeButoon (){
        view.addSubview(agreeButton)
        agreeButton.addTarget(self, action: #selector(handleAgree), for: .touchUpInside)
        NSLayoutConstraint.activate([
            agreeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            agreeButton.heightAnchor.constraint(equalToConstant: 34),
            agreeButton.widthAnchor.constraint(equalToConstant: 93),
            agreeButton.topAnchor.constraint(equalTo: bodyText.bottomAnchor, constant: 68)
        ])
    }
    
    @objc func handleAgree (){
        print("hi")
    }
    
    
}
