//
//  HomescreenViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/17/23.
//

import TinyConstraints

class HomescreenViewController: UIViewController {
    
    let relativeContrains : CGFloat = 0.060
    private lazy var screenImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "homeScreenImage")
        image.width(190)
        image.height(230)
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "HOME_LABEL_TITLE".localized()
        titleLabel.font = APPFont.title
        titleLabel.textColor = APPThemeColor.title
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "HOME_LABEL_DISCRIPTION".localized()
        descriptionLabel.font = APPFont.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = APPThemeColor.description
        descriptionLabel.textAlignment = .center
        return descriptionLabel
    }()
    
    private lazy var aboutButton: UIButton = {
        let aboutButton = UIButton()
        aboutButton.setTitle("HOME_LABEL_ABOUT_BUTTON_TITLE".localized(), for: .normal)
        aboutButton.height(40)
        aboutButton.width(200)
        aboutButton.setTitleColor(UIColor.black, for: .normal)
        aboutButton.addTarget(self, action: #selector(handelAbout), for: .touchUpInside)
        return aboutButton
    }()
    
    private lazy var termsButton: UIButton = {
        let termsButton = UIButton()
        termsButton.setTitle("HOME_LABEL_TERMS_BUTTON_TITLE".localized(), for: .normal)
        termsButton.height(40)
        termsButton.width(200)
        termsButton.setTitleColor(UIColor.black, for: .normal)
        termsButton.addTarget(self, action: #selector(handelTerms), for: .touchUpInside)
        return termsButton
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
        
        
        let textbuttonStackView = UIStackView(arrangedSubviews:[aboutButton, termsButton])
        textbuttonStackView.axis = .vertical
        textbuttonStackView.distribution = .fill
        textbuttonStackView.alignment = .fill
        textbuttonStackView.spacing = 10
        
        self.view.addSubview(textbuttonStackView)
        textbuttonStackView.centerXToSuperview()
        textbuttonStackView.bottomToSuperview(offset: -100, usingSafeArea: true)
    }
    
        @objc func handelAbout(){
            let vc = AboutApplicationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    
        @objc func handelTerms(){
    
        }
}
