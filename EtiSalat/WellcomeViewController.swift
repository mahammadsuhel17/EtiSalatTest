//
//  WellcomeViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/14/23.
//

import UIKit

class WellcomeViewController: UIViewController {
    
    var isCheckedLicence = false
    var isCheckedTerms = false
    var termsText = UILabel()
    var text = UILabel()
    
    // screen image
    private lazy var screenImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "WelcomeScreenImage")
        image.width(230)
        image.height(230)
        return image
    }()
    
    // title labal
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "WELCOME_LABEL_TITLE".localized()
        titleLabel.font = APPFont.title
        titleLabel.textColor = APPThemeColor.title
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    /// set description label
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "WELCOME_LABEL_DESCRIPTION".localized()
        descriptionLabel.font = APPFont.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = APPThemeColor.description
        descriptionLabel.textAlignment = .center
        descriptionLabel.letterSpace = 0.2
        return descriptionLabel
    }()
    
    
    // LICENCE CHECK BOX
    private lazy var lincenceCheckBox: UIButton  = {
        let lincenceCheckBox = UIButton()
        lincenceCheckBox.setImage(UIImage(systemName: "square"), for: [])
        lincenceCheckBox.tintColor = .darkGray
        lincenceCheckBox.contentMode = .scaleAspectFit
        lincenceCheckBox.height(18)
        lincenceCheckBox.width(18)
        lincenceCheckBox.addTarget(self, action: #selector(handleLicenceCheck), for: .touchUpInside)
        return lincenceCheckBox
    }()
    
    
    private lazy var licenseLabel: UILabel = {
        let licenseLabel = UILabel()
        licenseLabel.text = "WELCOME_LABEL_LICENSE_AGREEMENT".localized()
        licenseLabel.font = UIFont(name: "Roboto-Regular", size: 12)
        licenseLabel.textColor = APPThemeColor.black
        licenseLabel.numberOfLines = 0
        return licenseLabel
    }()
    
    
    // TERMS CHECK BOX
    private lazy var termCheckBox: UIButton  = {
        let termCheckBox = UIButton()
        termCheckBox.setImage(UIImage(systemName: "square"), for: [])
        termCheckBox.tintColor = .darkGray
        termCheckBox.contentMode = .scaleAspectFit
        termCheckBox.height(18)
        termCheckBox.width(18)
        termCheckBox.addTarget(self, action: #selector(handleTermsCheck), for: .touchUpInside)
        return termCheckBox
    }()
    
    private lazy var TermsLabel: UILabel = {
        let TermsLabel = UILabel()
        TermsLabel.text = "WELCOME_LABEL_TERMS".localized()
        TermsLabel.font = UIFont(name: "Roboto-Regular", size: 12)
        TermsLabel.textColor = .black
        TermsLabel.numberOfLines = 0
        return TermsLabel
    }()
    
    
    private lazy var agreeButton: CustomButton = {
        let agreeButton = CustomButton(hasBackground: true, title: "I agree", buttonType: .medium)
        agreeButton.backgroundColor = isCheckedLicence && isCheckedTerms ? APPThemeColor.buttonBackground : APPThemeColor.disabledButtonBackground
        agreeButton.setTitleColor(APPThemeColor.disabledButtonTitle, for: [])
        agreeButton.addTarget(self, action: #selector(didTapOnnAgreeButton), for: .touchUpInside)
        return agreeButton
    }()
    
    private lazy var popUp: popUpViewController = {
        let popUp = popUpViewController()
        return popUp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = ""
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
        
        
        /// set stackview for license and checkBox
        let licenseLableStackview = UIStackView(arrangedSubviews: [ lincenceCheckBox, licenseLabel])
        licenseLableStackview.axis = .horizontal
        licenseLableStackview.distribution = .fillProportionally
        licenseLableStackview.alignment = .fill
        licenseLableStackview.spacing = 16
        
        self.view.addSubview(licenseLableStackview)
        licenseLableStackview.topToBottom(of:imageLabelStackView, offset: 30 )
        licenseLableStackview.leftToSuperview(offset: 16)
        licenseLableStackview.rightToSuperview(offset: -16)
        
        
        /// set stackview for terms and checkBox
        let termsLableStackview = UIStackView(arrangedSubviews: [ termCheckBox, TermsLabel])
        termsLableStackview.axis = .horizontal
        termsLableStackview.distribution = .fillProportionally
        termsLableStackview.alignment = .fill
        termsLableStackview.spacing = 16

        self.view.addSubview(termsLableStackview)
        termsLableStackview.topToBottom(of:licenseLableStackview, offset: 20 )
        termsLableStackview.leftToSuperview(offset: 16)
        termsLableStackview.rightToSuperview(offset: -16)
        
//        set agree button
        self.view.addSubview(agreeButton)
        agreeButton.centerXToSuperview()
        agreeButton.topToBottom(of: termsLableStackview, offset: 50)
    }

    
    @objc func handleLicenceCheck(){
        isCheckedLicence = !isCheckedLicence
        if(isCheckedLicence){
            lincenceCheckBox.setImage(UIImage(systemName: "checkmark.square.fill"), for: [])
            lincenceCheckBox.tintColor = .red
            agreeButton.backgroundColor = isCheckedTerms ? APPThemeColor.buttonBackground : APPThemeColor.disabledButtonBackground
            agreeButton.setTitleColor( !isCheckedTerms ? APPThemeColor.disabledButtonTitle :APPThemeColor.buttonTitle, for: [])
            
        }else{
            lincenceCheckBox.setImage(UIImage(systemName: "square"), for: [])
            lincenceCheckBox.tintColor = .darkGray
            agreeButton.backgroundColor = APPThemeColor.disabledButtonBackground
            agreeButton.setTitleColor(APPThemeColor.disabledButtonTitle, for: [])
        }
        
    }
    
    @objc func handleTermsCheck(){
        isCheckedTerms = !isCheckedTerms
        if(isCheckedTerms){
            termCheckBox.setImage(UIImage(systemName: "checkmark.square.fill"), for: [])
            termCheckBox.tintColor = .red
            agreeButton.backgroundColor = isCheckedLicence ? APPThemeColor.buttonBackground : APPThemeColor.disabledButtonBackground
            agreeButton.setTitleColor( !isCheckedLicence ? APPThemeColor.disabledButtonTitle :APPThemeColor.buttonTitle, for: [])
        }else{
            termCheckBox.setImage(UIImage(systemName: "square"), for: [])
            termCheckBox.tintColor = .darkGray
            agreeButton.backgroundColor = APPThemeColor.disabledButtonBackground
            agreeButton.setTitleColor(APPThemeColor.disabledButtonTitle, for: [])
        }
       print("lincenceCheckBox", isCheckedLicence)
        print("isCheckedTerms", isCheckedTerms)
    }
    
    @objc func didTapOnnAgreeButton() {
        if(!isCheckedLicence || !isCheckedTerms){
            showCloseConfirmPopUp(buttonTitle: .actionAgree, title: "WELCOME_ALERT_TITLE_LABEL".localized(), subTitle: "WELCOME_ALERT_DESCRIPTION_LABEL".localized(), style: .default) {
            }
        }else{
            let vc = ActivationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func handleContinue(){
        popUp.dismiss(animated: true)
    }

}
