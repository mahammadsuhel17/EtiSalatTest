//
//  SuccessViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/17/23.
//

import UIKit

class SuccessViewController: UIViewController {
    
    
    private lazy var screenImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "successScreenImge")
        image.width(230)
        image.height(230)
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "SUCCESS_LABEL_TITLE".localized()
        titleLabel.font = APPFont.title
        titleLabel.textColor = APPThemeColor.title
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "SUCCESS_LABEL_DISCRIPTION".localized()
        descriptionLabel.font = APPFont.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = APPThemeColor.description
        descriptionLabel.textAlignment = .center
        return descriptionLabel
    }()
    
    private lazy var doneButton: CustomButton = {
        let doneButton = CustomButton(hasBackground: true, title: "SUCCESS_BUTTON_TITLE".localized(), buttonType: .medium)
        doneButton.backgroundColor = APPThemeColor.buttonBackground
        doneButton.addTarget(self, action: #selector(handleDone), for: .touchUpInside)
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
        
        self.view.addSubview(doneButton)
        doneButton.centerXToSuperview()
        doneButton.topToBottom(of: imageLabelStackView, offset: 45)
    }
    
    @objc func handleDone (){
        let vc = HomescreenViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
