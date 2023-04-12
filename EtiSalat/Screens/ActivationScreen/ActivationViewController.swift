//
//  ActivationViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/15/23.
//

import TinyConstraints

class ActivationViewController: UIViewController, UITextFieldDelegate {
    // key count
    var textCount = 0
    var loader = LoaderViewController()
    private var viewModel = ActivationViewModel()

//    set navigation view
       private lazy var navBar: UIView = {
           let navBar = UIView()
           navBar.backgroundColor = APPThemeColor.primaryColor
           return navBar
       }()
    
    ///  set navigation label
       private lazy var navigationLabel: LabelTheme = {
           let navigationLabel = LabelTheme()
           navigationLabel.text = viewModel.getTitles(for: .ActivationTitle)
           navigationLabel.textTheme = .headingText
           navigationLabel.numberOfLines = 0
           return navigationLabel
       }()
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



    // screen title
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = viewModel.getTitles(for: .ActivationTitle)
        titleLabel.font = APPFont.title
        titleLabel.textColor = APPThemeColor.title
        return titleLabel
    }()

    // screen discription
    private lazy var descriptionLabel: LabelTheme = {
        let descriptionLabel = LabelTheme()
        descriptionLabel.text = viewModel.getTitles(for: .ActivationDescription)
        descriptionLabel.font = UIFont(name: "Roboto-Regular", size: 12)
        descriptionLabel.textTheme = .bodyText
        return descriptionLabel
    }()

    // key input placeholder
    private lazy var placeHolder: LabelTheme = {
        let placeHolder = LabelTheme()
        placeHolder.text = viewModel.getTitles(for: .ActivationPlaceholder)
        placeHolder.textTheme = .bodyMediumText
        return placeHolder
    }()

    //key input
    private lazy var inputField: TextFieldTheme = {
        let inputField = TextFieldTheme()
        inputField.addBottomBorderWithColor(color: UIColor(hexString: "#5c5c5c"))
        inputField.height(50)
        inputField.maxLength = 9
        inputField.languageCode = NSLocale.current.language.languageCode?.identifier
        inputField.delegate = self
        inputField.addTarget(self, action: #selector(self.handleTextChange(_:)), for: .editingChanged)
        return inputField
    }()

    // text count lable
    private lazy var textCountLableView: LabelTheme = {
        let textCountLableView = LabelTheme()
        textCountLableView.text = "0/9"
        textCountLableView.textTheme = .linkText
        return textCountLableView
    }()

    private lazy var submitButton: ButtonTheme = {
        let submitButton = ButtonTheme()
        submitButton.setTitle(viewModel.getTitles(for: .ActivationButtonTitle), for: [])
        submitButton.buttonTheme =  .disabled
        submitButton.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        return submitButton
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI()
    }

    func configureUI(){
        
        view.addSubview(navBar)
        navBar.edgesToSuperview(excluding: [.bottom], insets: UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0), usingSafeArea: true)
        navBar.height(56)
        ///set heading label
        navBar.addSubview(navigationLabel)
        navigationLabel.edgesToSuperview()


        view.addSubview(scrollView)
        scrollView.topToBottom(of: navBar)
        scrollView.edgesToSuperview(excluding: [.top])
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y), animated: true)
        self.scrollView.isDirectionalLockEnabled  = true
        
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.width(to: scrollView)
        
        self.contentView.addSubview(descriptionLabel)
        descriptionLabel.edgesToSuperview(excluding: [.bottom], insets: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16))
        
        self.contentView.addSubview(placeHolder)
        placeHolder.topToBottom(of: descriptionLabel, offset: 16)
        placeHolder.edgesToSuperview(excluding: [.top, .bottom], insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        
        self.contentView.addSubview(inputField)
        inputField.topToBottom(of: placeHolder,offset: 0)
        inputField.edgesToSuperview(excluding: [.top, .bottom], insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        
        self.contentView.addSubview(textCountLableView)
        textCountLableView.topToBottom(of: inputField, offset: 10)
        textCountLableView.trailing(to: inputField, offset: 0)
        
        self.contentView.addSubview(submitButton)
        submitButton.width(107)
        submitButton.height(34)
        submitButton.centerXToSuperview()
        submitButton.topToBottom(of: textCountLableView, offset: 16)
        submitButton.edgesToSuperview(excluding: [.top, .left, .right], insets: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0))
        
        toggleSubmitButton()
    }
    
    //MARK: toggle submit button
    func toggleSubmitButton() {
        if inputField.text?.count == 9 {
            submitButton.isUserInteractionEnabled = true
            submitButton.buttonTheme = .enabled
        } else {
            submitButton.isUserInteractionEnabled = false
            submitButton.buttonTheme = .disabled
        }
    }

    // function to handle the input value change
        @objc func handleTextChange (_ textField: UITextField){
            textCountLableView.text = "\(textField.text?.count ?? 0)/9"
            toggleSubmitButton()
        }

    // function to handle submit button
        @objc func handleSubmit(){
            
            // button loader
            
//            submitButton.isLoading = true
//            self.submitButton.backgroundColor = .clear
//            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
//                self.submitButton.isLoading = false
//                self.submitButton.backgroundColor = APPThemeColor.buttonBackground
//                let vc = SuccessViewController()
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
            
//            full screen loader with modal view presentation
            let vc = loader
            vc.modalPresentationStyle =  .overCurrentContext
            self.present(vc, animated: true)
            self.submitButton.backgroundColor = .clear
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                vc.navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)
                self.submitButton.backgroundColor = APPThemeColor.buttonBackground
                let vc = SuccessViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            

        }
    
    func initializeHideKeyboard(){
     let tap: UITapGestureRecognizer = UITapGestureRecognizer(
     target: self,
     action: #selector(dismissMyKeyboard))
     view.addGestureRecognizer(tap)
     }
     @objc func dismissMyKeyboard(){
     view.endEditing(true)
     }

}


