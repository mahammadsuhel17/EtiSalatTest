//
//  SuccessViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/17/23.
//

import UIKit

class SuccessViewController: UIViewController {

//    var Button = CustomButton(hasBackground: true, title: "Done", buttonType: .big )
    
    private lazy var screenImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "WelcomeScreenImage")
        image.width(230)
        image.height(230)
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Welcome"
        titleLabel.font = UIFont(name: "Roboto-Bold", size: 24)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Parental Control is developed to keep your family safe from screen addiction and harmful Internet content."
        descriptionLabel.font = UIFont(name: "Roboto-Regular", size: 16)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .black
        descriptionLabel.textAlignment = .center
        return descriptionLabel
    }()
    
    private lazy var doneButton: CustomButton = {
        let doneButton = CustomButton(hasBackground: true, title: "Done", buttonType: .medium)
        doneButton.backgroundColor = .red
//        doneButton.addTarget(self, action: #selector(didTapOnnAgreeButton), for: .touchUpInside)
        return doneButton
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    func configureUI (){
    
        let imageHolderView = UIView()
        imageHolderView.addSubview(screenImage)
        screenImage.centerInSuperview()
        imageHolderView.height(300)
        
        /// set stackview for labels
        let labelStackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        labelStackView.axis = .vertical
        labelStackView.distribution = .fill
        labelStackView.alignment = .fill
        labelStackView.spacing = 20
        
        /// set stackview for image  and labels
        let imageLabelStackView = UIStackView(arrangedSubviews: [imageHolderView, labelStackView])
        imageLabelStackView.axis = .vertical
        imageLabelStackView.distribution = .fill
        imageLabelStackView.alignment = .fill
        imageLabelStackView.spacing = 20
        
        self.view.addSubview(imageLabelStackView)
        imageLabelStackView.topToSuperview(offset: 24, usingSafeArea: true)
        imageLabelStackView.leftToSuperview(offset: 16)
        imageLabelStackView.rightToSuperview(offset: -16)
    }
//    func configureScreenImage (){
//        view.addSubview(screenImage)
//        screenImage.translatesAutoresizingMaskIntoConstraints = false
//        screenImage.image = UIImage(named: "successScreenImge")
//
//        NSLayoutConstraint.activate([
//            screenImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            screenImage.heightAnchor.constraint(equalToConstant: 260),
//            screenImage.widthAnchor.constraint(equalToConstant: 260),
//            screenImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 165)
//        ])
//    }
//    func configureMainText (){
//        view.addSubview(mainText)
//        mainText.translatesAutoresizingMaskIntoConstraints = false
//        mainText.text = "Congratulations, you made it!"
//        mainText.textAlignment = .center
//        mainText.font = .systemFont(ofSize: 24, weight: .medium)
//
//        NSLayoutConstraint.activate([
//            mainText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            mainText.topAnchor.constraint(equalTo: screenImage.bottomAnchor, constant: 25),
//            mainText.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            mainText.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
//    }
//
//    func configureBodyText (){
//        view.addSubview(bodyText)
//        bodyText.translatesAutoresizingMaskIntoConstraints = false
//        bodyText.text = "This device is now protected."
//        bodyText.textAlignment = .center
//        bodyText.font = .systemFont(ofSize: 16, weight: .regular)
//        bodyText.numberOfLines = 0
//
//        NSLayoutConstraint.activate([
//            bodyText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            bodyText.topAnchor.constraint(equalTo: mainText.bottomAnchor, constant: 25),
//            bodyText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
//            bodyText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
//        ])
//    }
//
//    func configureButton (){
//        view.addSubview(Button)
//        Button.translatesAutoresizingMaskIntoConstraints = false
//        Button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
//        Button.addTarget(self, action: #selector(handelButton), for: .touchUpInside)
//
//        NSLayoutConstraint.activate([
//            Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            Button.topAnchor.constraint(equalTo: bodyText.bottomAnchor, constant: 30),
//            ])
//    }
//
//            @objc func handelButton(){
//
//            }
}
