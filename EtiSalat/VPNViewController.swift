//
//  VPNViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/15/23.
//

import UIKit

class VPNViewController: UIViewController {
//    var installButton = CustomButton(hasBackground: true, title: "I agree", buttonType: .medium)
    
    // screen image
    private lazy var screenImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "vpnScreenImge")
        image.width(230)
        image.height(230)
        return image
    }()
    
    // screen title
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "VPN_LABEL_TITLE".localized()
        titleLabel.font = APPFont.title
        titleLabel.textColor = APPThemeColor.title
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    // screen discription
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "VPN_LABEL_DISCRIPTION".localized()
        descriptionLabel.font = APPFont.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = APPThemeColor.description
        descriptionLabel.textAlignment = .center
        return descriptionLabel
    }()
    
    private lazy var installButton: CustomButton = {
        let installButton = CustomButton(hasBackground: true, title: "VPN_LABEL_BUTTON_TITLE".localized(), buttonType: .medium)
        installButton.backgroundColor = APPThemeColor.buttonBackground
        installButton.setTitleColor(APPThemeColor.buttonTitle, for: [])
        installButton.addTarget(self, action: #selector(handleInstall), for: .touchUpInside)
        return installButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    func configureUI (){
        ///  set view for imageview
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
        
        self.view.addSubview(installButton)
        installButton.topToBottom(of: imageLabelStackView, offset: 70)
        installButton.centerXToSuperview()
    }
    
    
        @objc func handleInstall (){
    
    
        }
}
