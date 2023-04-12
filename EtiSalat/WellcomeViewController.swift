//
//  WellcomeViewController.swift
//  EtiSalat
//
// Created by Mahammadsuel C on 3/14/23.
//


import UIKit
import TinyConstraints

class WellcomeViewController: UIViewController {

    ///  set welcome image
    private lazy var welcomeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "WelcomeScreenImage")
        return image
    }()
    ///  set title label
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "WELCOME_LABEL_TITLE".localized()
        titleLabel.font = APPFont.title
        titleLabel.textColor = APPThemeColor.title
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    /// set description label
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "WELCOME_LABEL_DESCRIPTION".localized()
        descriptionLabel.font = APPFont.description
        descriptionLabel.textColor = APPThemeColor.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.letterSpace = 0.2
        descriptionLabel.setLineSpacing(lineSpacing: 2)
        descriptionLabel.textAlignment = .center
        return descriptionLabel
    }()
    /// set user license agreement view
    private lazy var licenseAgreementView: UIView = {
        let licenseView = UIView()
        return licenseView
    }()
    /// set license agreement Button
    private lazy var licenseAgreementCheckbox: UIButton = {
        let licenseCheckbox = UIButton()
        licenseCheckbox.setImage(UIImage(systemName: "square"), for: [])
        licenseCheckbox.tintColor = .black
        licenseCheckbox.height(30)
        licenseCheckbox.width(30)
        licenseCheckbox.accessibilityIdentifier = "licenseCheck"
        licenseCheckbox.contentEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        licenseCheckbox.addTarget(self, action: #selector(toggleCheckbox(sender:)), for: .touchUpInside)
        return licenseCheckbox
    }()
    /// set License label
    private lazy var licenseAgreementLabel: UILabel = {
        let licenseLabel = UILabel()
        licenseLabel.font = APPFont.extraSmall
        licenseLabel.textColor = APPThemeColor.title
        licenseLabel.numberOfLines = 0
        licenseLabel.letterSpace = 0.2
        licenseLabel.setLineSpacing(lineSpacing: 2)
        
        return licenseLabel
    }()
    /// set license privacyTerms view
    private lazy var privacyTermsView: UIView = {
        let privacyTermsView = UIView()
        return privacyTermsView
    }()
    /// set privacyTermsCheckbox Button
    private lazy var privacyTermsCheckbox: UIButton = {
        let privacyTermsCheckbox = UIButton()
        privacyTermsCheckbox.setImage(UIImage(systemName: "square"), for: [])
        privacyTermsCheckbox.tintColor = .black
        privacyTermsCheckbox.height(30)
        privacyTermsCheckbox.width(30)
        privacyTermsCheckbox.accessibilityIdentifier = "privecyCheck"
        privacyTermsCheckbox.contentEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        privacyTermsCheckbox.addTarget(self, action: #selector(toggleCheckbox(sender:)), for: .touchUpInside)
        return privacyTermsCheckbox
    }()
    /// set License label
    private lazy var privacyTermsLabel: UILabel = {
        let privacyTermsLabel = UILabel()
        privacyTermsLabel.font = APPFont.extraSmall
        privacyTermsLabel.textColor = APPThemeColor.title
        privacyTermsLabel.numberOfLines = 0
        privacyTermsLabel.letterSpace = 0.2
        privacyTermsLabel.setLineSpacing(lineSpacing: 2)
        return privacyTermsLabel
    }()
    
    /// set agree button
    private lazy var contiueButton: CustomButton = {
        let contiueButton = CustomButton(hasBackground: true, title: "WELCOME_BUTTON_TITLE".localized(), buttonType: .medium)
        contiueButton.setTitleColor(APPThemeColor.disabledButtonTitle, for: [])
        contiueButton.backgroundColor = APPThemeColor.disabledButtonBackground
        contiueButton.accessibilityIdentifier = "continue"
        contiueButton.addTarget(self, action: #selector(didTapOnContinueButton), for: .touchUpInside)
        return contiueButton
    }()
        
    var isLicenseAgreementChecked = false
    var isPrivacyTermsChecked = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }

    func configureUI (){
        
        /// set stackview for labels
        let labelStackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        labelStackView.axis = .vertical
        labelStackView.distribution = .fill
        labelStackView.alignment = .fill
        labelStackView.spacing = 19

        ///  set view for imageview
        let imageHolderView = UIView()
        self.view.addSubview(imageHolderView)
        imageHolderView.addSubview(welcomeImage)
        welcomeImage.centerXToSuperview()
        welcomeImage.bottom(to: imageHolderView)
        welcomeImage.height(CGFloat(screenHeight/2.5))
        welcomeImage.width(CGFloat(screenHeight/2.5) )
        imageHolderView.leftToSuperview(offset: 65)
        imageHolderView.rightToSuperview(offset: -65)
        imageHolderView.height(CGFloat(screenHeight/2))
        
        /// set stackview for image  and labels
        let imageLabelStackView = UIStackView(arrangedSubviews: [imageHolderView, labelStackView])
        imageLabelStackView.axis = .vertical
        imageLabelStackView.distribution = .fill
        imageLabelStackView.alignment = .fill
        imageLabelStackView.spacing = 19

        self.view.addSubview(imageLabelStackView)
        imageLabelStackView.leftToSuperview(offset: 16)
        imageLabelStackView.rightToSuperview(offset: -16)
        
        setLinkLabels()
        
        /// set stackview for license and checkBox
        let licenseAgreementView = UIStackView(arrangedSubviews: [ licenseAgreementCheckbox, licenseAgreementLabel])
        licenseAgreementView.axis = .horizontal
        licenseAgreementView.distribution = .fill
        licenseAgreementView.alignment = .fill
//        licenseAgreementView.spacing = 5

        self.view.addSubview(licenseAgreementView)
        licenseAgreementView.topToBottom(of:imageLabelStackView, offset: 30 )
        licenseAgreementView.leftToSuperview(offset: 16)
        licenseAgreementView.rightToSuperview(offset: -16)
            //set stackview for terms and checkBox
        let privacyTermsView = UIStackView(arrangedSubviews: [ privacyTermsCheckbox, privacyTermsLabel])
        privacyTermsView.axis = .horizontal
        privacyTermsView.distribution = .fillProportionally
        privacyTermsView.alignment = .fill
//        privacyTermsView.spacing = 16

        self.view.addSubview(privacyTermsView)
        privacyTermsView.topToBottom(of:licenseAgreementView, offset: 20 )
        privacyTermsView.leftToSuperview(offset: 16)
        privacyTermsView.rightToSuperview(offset: -16)
    
        
        /// set stackview for license agreement and privacy Terms
        let LinkLabelsStackView = UIStackView(arrangedSubviews: [licenseAgreementView, privacyTermsView])
        LinkLabelsStackView.axis = .vertical
        LinkLabelsStackView.distribution = .fill
        LinkLabelsStackView.alignment = .fill
        LinkLabelsStackView.spacing = 19
        
        self.view.addSubview(LinkLabelsStackView)
        LinkLabelsStackView.topToBottom(of: imageLabelStackView, offset: 19)
        LinkLabelsStackView.leftToSuperview(offset: 16)
        LinkLabelsStackView.rightToSuperview(offset: -16)
      
        ///set contiueButton
        self.view.addSubview(contiueButton)
        contiueButton.width(107)
        contiueButton.height(34)
        contiueButton.centerXToSuperview()
        contiueButton.topToBottom(of:LinkLabelsStackView, offset: 19 )
        
        //set button status
        toggleContinueButton()
    
    }
    
    func setLinkLabels() {
        let attrs1 = [NSAttributedString.Key.font : UIFont(name: RegularTextFontName, size: CGFloat(SmallTitleFontSize)), NSAttributedString.Key.foregroundColor : APPThemeColor.title]
        let attrs2 = [NSAttributedString.Key.font : UIFont(name: RegularTextFontName, size: CGFloat(SmallTitleFontSize)) as Any, NSAttributedString.Key.foregroundColor : APPThemeColor.link, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue] as [NSAttributedString.Key : Any]
        
        let licenseText1 = NSMutableAttributedString(string: "WELCOME_LABEL_LICENSE_AGREEMENT".localized(), attributes:attrs1 as [NSAttributedString.Key : Any])
        let licenseText2 = NSMutableAttributedString(string:"WELCOME_LABEL_LICENSE_AGREEMENT_LINK".localized(), attributes:attrs2 as [NSAttributedString.Key : Any])
        
        
        ///set license  agreement text
        licenseText1.append(licenseText2)
        licenseAgreementLabel.numberOfLines = 0
        self.licenseAgreementLabel.attributedText = licenseText1
        let licenseAgreementtapGesture = UITapGestureRecognizer(target: self, action: #selector(licenseAgreementLabelTapped))
        licenseAgreementLabel.addGestureRecognizer(licenseAgreementtapGesture)
        licenseAgreementLabel.isUserInteractionEnabled = true
        
        
        ///set privacy terms text
        let privacyText1 = NSMutableAttributedString(string: "WELCOME_LABEL_TERMS".localized(), attributes:attrs1 as [NSAttributedString.Key : Any])
        let privacyText2 = NSMutableAttributedString(string:"WELCOME_LABEL_PRIVACY_TERMS_LINK".localized(), attributes:attrs2 as [NSAttributedString.Key : Any])
        privacyText1.append(privacyText2)
        privacyTermsLabel.numberOfLines = 0
        self.privacyTermsLabel.attributedText = privacyText1
        let privacyTermstapGesture = UITapGestureRecognizer(target: self, action: #selector(privacyTermsLabelTapped))
        privacyTermsLabel.addGestureRecognizer(privacyTermstapGesture)
        privacyTermsLabel.isUserInteractionEnabled = true
    }
    
    @objc func privacyTermsLabelTapped(){
        print("tap")
    }
    
    @objc func licenseAgreementLabelTapped(){
        print("tap")
    }
    
    @IBAction func toggleCheckbox(sender: UIButton) {
        if sender == licenseAgreementCheckbox {
            if(isLicenseAgreementChecked) {
                licenseAgreementCheckbox.setImage(UIImage(systemName: "square"), for: [])
                licenseAgreementCheckbox.tintColor = .darkGray
            } else {
                licenseAgreementCheckbox.setImage(UIImage(systemName: "checkmark.square.fill"), for: [])
                licenseAgreementCheckbox.tintColor = .red
            }
            isLicenseAgreementChecked = !isLicenseAgreementChecked
        } else if sender == privacyTermsCheckbox {
            if(isPrivacyTermsChecked) {
                privacyTermsCheckbox.setImage(UIImage(systemName: "square"), for: [])
                privacyTermsCheckbox.tintColor = .darkGray
            } else {
                privacyTermsCheckbox.setImage(UIImage(systemName: "checkmark.square.fill"), for: [])
                privacyTermsCheckbox.tintColor = .red
            }
            isPrivacyTermsChecked = !isPrivacyTermsChecked
        }
        toggleContinueButton()
    }

    func toggleContinueButton() {
        if isLicenseAgreementChecked && isPrivacyTermsChecked {
            contiueButton.isUserInteractionEnabled =  true
            contiueButton.backgroundColor = APPThemeColor.buttonBackground
            contiueButton.setTitleColor(APPThemeColor.buttonTitle, for: [])
        } else {
//            contiueButton.isUserInteractionEnabled =  false
            contiueButton.backgroundColor = APPThemeColor.disabledButtonBackground
            contiueButton.setTitleColor(APPThemeColor.disabledButtonTitle, for: [])
        }
    }
    
    @objc func didTapOnContinueButton() {
        if(!isLicenseAgreementChecked || !isPrivacyTermsChecked){
//            showCloseConfirmPopUp(buttonTitle: .actionAgree, title: "WELCOME_ALERT_TITLE_LABEL".localized(), subTitle: "WELCOME_ALERT_DESCRIPTION_LABEL".localized(), style: .destructive) {
//            }
        }
            else{
                let vc = VPNViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
    }
    
}

