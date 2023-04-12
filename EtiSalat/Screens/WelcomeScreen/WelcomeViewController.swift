//
//  ViewController.swift
//  Allot
//
//  Created by Mani Deepika J M on 3/16/23.
//

import UIKit
import TinyConstraints

class WelcomeViewController: UIViewController {
    /// get or set viewModel
    private var viewModel = WelcomeViewModel()
    
    /// set  scrollview
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    ///  set content view
    private lazy var contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()

    ///  set welcome image
    private lazy var welcomeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "WelcomeIcon")
        return image
    }()
    ///  set title label
    private lazy var titleLabel: LabelTheme = {
        let titleLabel = LabelTheme()
        titleLabel.text = viewModel.getTitles(for: .welcomeTitle)
        titleLabel.textTheme = .titleText
        return titleLabel
    }()
    /// set description label
    private lazy var descriptionLabel: LabelTheme = {
        let descriptionLabel = LabelTheme()
        descriptionLabel.text = viewModel.getTitles(for: .welcomeDescription)
        descriptionLabel.textTheme = .descriptionText
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
        licenseCheckbox.setImage(UIImage(named: "UnCheck"), for: [])
        licenseCheckbox.width(viewModel.getCheckboxDimensions(for: .dimension))
        licenseCheckbox.height(viewModel.getCheckboxDimensions(for: .dimension))
        return licenseCheckbox
    }()
    /// set license agreement text
    private lazy var licenseAgreementTextView: TextViewTheme = {
        let txtView = TextViewTheme()
        txtView.delegate = self
        return txtView
    }()
    /// set license privacyTerms view
    private lazy var privacyTermsView: UIView = {
        let privacyTermsView = UIView()
        return privacyTermsView
    }()
    /// set privacyTermsCheckbox Button
    private lazy var privacyTermsCheckbox: UIButton = {
        let privacyTermsCheckbox = UIButton()
        privacyTermsCheckbox.setImage(UIImage(named: "UnCheck"), for: [])
        privacyTermsCheckbox.width(viewModel.getCheckboxDimensions(for: .dimension))
        privacyTermsCheckbox.height(viewModel.getCheckboxDimensions(for: .dimension))
        return privacyTermsCheckbox
    }()
    /// set License label
    private lazy var privacyTermsTextView: TextViewTheme = {
        let txtView = TextViewTheme()
        txtView.delegate = self
        return txtView
    }()
    /// set agree button
    private lazy var contiueButton: ButtonTheme = {
        let contiueButton = ButtonTheme()
        contiueButton.setTitle(viewModel.getTitles(for: .welcomeButtonTitle), for: [])
        contiueButton.buttonTheme = .disabled
        contiueButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapOnContinueButton)))
        return contiueButton
    }()
    
    //MARK: Declarations
    var isLicenseAgreementChecked = false
    var isPrivacyTermsChecked = false

    //MARK: Didload
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }

    //MARK: Configure UI
    func configureUI (){
        
        ///set scrollview
        view.addSubview(scrollView)
        scrollView.topToSuperview(offset: 20, usingSafeArea: true)
        scrollView.edgesToSuperview(excluding: [.top])
        
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y), animated: true)
        self.scrollView.isDirectionalLockEnabled  = true
        
        ///add content view on scrollview
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.width(to: scrollView)
        
        /// set stackview for labels
        let labelStackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        labelStackView.axis = .vertical
        labelStackView.distribution = .fill
        labelStackView.alignment = .fill
        labelStackView.spacing = 16

        ///  set view for imageview
        let imageHolderView = UIView()
        imageHolderView.addSubview(welcomeImage)
        welcomeImage.centerInSuperview()
        imageHolderView.height(230)
        
        /// set stackview for image  and labels
        let imageLabelStackView = UIStackView(arrangedSubviews: [imageHolderView, labelStackView])
        imageLabelStackView.axis = .vertical
        imageLabelStackView.distribution = .fill
        imageLabelStackView.alignment = .fill
        imageLabelStackView.spacing = 16

        self.contentView.addSubview(imageLabelStackView)
        imageLabelStackView.topToSuperview(offset: 24, usingSafeArea: true)
        imageLabelStackView.leftToSuperview(offset: 26)
        imageLabelStackView.rightToSuperview(offset: -26)
        
        ///set license agreement view
        self.licenseAgreementView.addSubview(licenseAgreementCheckbox)
        licenseAgreementCheckbox.centerYToSuperview()
        licenseAgreementCheckbox.leading(to: licenseAgreementView)
        licenseAgreementCheckbox.addTarget(self, action: #selector(toggleCheckboxLicenseAgreement(sender:)), for: .touchUpInside)
        licenseAgreementCheckbox.contentEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        
        ///set license agreement text
        licenseAgreementTextView.addHyperLinksToText(originalText: viewModel.getTitles(for: .defaultLinkTitle) + viewModel.getTitles(for: .licenseAgreementLinkTitle), hyperLinks: [viewModel.getTitles(for: .licenseAgreementLinkTitle): licenseAgreementURL])
        self.licenseAgreementView.addSubview(licenseAgreementTextView)
        licenseAgreementTextView.top(to: licenseAgreementView, offset: 0)
        licenseAgreementTextView.leadingToTrailing(of: licenseAgreementCheckbox)
        licenseAgreementTextView.trailing(to: licenseAgreementView, offset: -16)
        licenseAgreementTextView.bottom(to: licenseAgreementView, offset: 0)
       
        ///set privacy terms view
        self.privacyTermsView.addSubview(privacyTermsCheckbox)
        privacyTermsCheckbox.centerYToSuperview()
        privacyTermsCheckbox.leading(to: privacyTermsView)
        privacyTermsCheckbox.addTarget(self, action: #selector(toggleCheckboxPrivacyTerms(sender:)), for: .touchUpInside)
        privacyTermsCheckbox.contentEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
   
        ///set privacy terms text
        privacyTermsTextView.addHyperLinksToText(originalText: viewModel.getTitles(for: .defaultLinkTitle) + viewModel.getTitles(for: .privacyTermsLinkTitle), hyperLinks: [viewModel.getTitles(for: .privacyTermsLinkTitle): privacyTermsURL])
        self.privacyTermsView.addSubview(privacyTermsTextView)
        privacyTermsTextView.top(to: privacyTermsView, offset: 0)
        privacyTermsTextView.leadingToTrailing(of: privacyTermsCheckbox)
        privacyTermsTextView.trailing(to: privacyTermsView, offset: -16)
        privacyTermsTextView.bottom(to: privacyTermsView, offset: 0)
        
        /// set stackview for license agreement and privacy Terms
        let LinkLabelsStackView = UIStackView(arrangedSubviews: [licenseAgreementView, privacyTermsView])
        LinkLabelsStackView.axis = .vertical
        LinkLabelsStackView.distribution = .fill
        LinkLabelsStackView.alignment = .fill
        LinkLabelsStackView.spacing = 8
        
        self.contentView.addSubview(LinkLabelsStackView)
        LinkLabelsStackView.topToBottom(of: imageLabelStackView, offset: 16)
        LinkLabelsStackView.edgesToSuperview(excluding: [.top, .bottom], insets: UIEdgeInsets(top: 0, left: 26, bottom: 0, right: 26))

      
        ///set contiueButton
        self.contentView.addSubview(contiueButton)
        contiueButton.width(107)
        contiueButton.height(34)
        contiueButton.centerXToSuperview()
        contiueButton.topToBottom(of: LinkLabelsStackView, offset: 20)
        contiueButton.edgesToSuperview(excluding: [.top, .left, .right], insets: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0))

    }

    
    //MARK: Redirect to webView
    func redirectToWebView(url: String) {
        let nextVC = AppWebViewViewController()
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.urlString = url
        present(nextVC, animated: true)
    }
        
    //MARK: did tap on checkbox for License Agreement
    @IBAction func toggleCheckboxLicenseAgreement(sender: UIButton) {
        let imageName = isLicenseAgreementChecked ? "UnCheck" : "Check"
        licenseAgreementCheckbox.setImage(UIImage(named: imageName), for: [])
        isLicenseAgreementChecked = !isLicenseAgreementChecked
        toggleContinueButton()
    }
    //MARK: did tap on checkbox for PrivacyTerms
    @IBAction func toggleCheckboxPrivacyTerms(sender: UIButton) {
        let imageName = isPrivacyTermsChecked ? "UnCheck" : "Check"
        privacyTermsCheckbox.setImage(UIImage(named: imageName), for: [])
        isPrivacyTermsChecked = !isPrivacyTermsChecked
        toggleContinueButton()
    }

    //MARK: enable  on disable toggle button
    func toggleContinueButton() {
        if isLicenseAgreementChecked && isPrivacyTermsChecked {
            contiueButton.buttonTheme = .enabled
        } else {
            contiueButton.buttonTheme = .disabled
        }
    }
    
    //MARK: did tap on continue button
    @objc func didTapOnContinueButton() {
        if isLicenseAgreementChecked && isPrivacyTermsChecked {
            let nextVC = VPNViewController()
            nextVC.modalPresentationStyle =  .fullScreen
            self.present(nextVC, animated: true)
        } else {
            showCloseConfirmPopUp(buttonTitle: .actionCotinue, title: viewModel.getTitles(for: .alertTitle), subTitle: viewModel.getTitles(for: .alertDescription), style: .default){}
        }
    }
    
}

//MARK: textview delegate methods
extension WelcomeViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        redirectToWebView(url: URL.absoluteString)
        return false
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        var range = NSRange()
        range.location = 0
        range.length = 0
        licenseAgreementTextView.selectedRange = range
    }
}
