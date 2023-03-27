//
//  ActivationViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/15/23.
//

import TinyConstraints

class ActivationViewController: UIViewController {
    // key count
    var textCount = 0
    
    // screen title
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "ACTIVATION_LABEL_TITLE".localized()
        titleLabel.font = APPFont.title
        titleLabel.textColor = APPThemeColor.title
        return titleLabel
    }()
    
    // screen discription
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "ACTIVATION_LABEL_DESCRIPTION".localized()
        descriptionLabel.font = UIFont(name: "Roboto-Regular", size: 12)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = APPThemeColor.description
        return descriptionLabel
    }()
    
    // key input placeholder
    private lazy var placeHolder: UILabel = {
        let placeHolder = UILabel()
        placeHolder.text = "ACTIVATION_LABEL_PLACEHOLDER".localized()
        placeHolder.font = UIFont(name: "Roboto-Bold", size: 12)
        placeHolder.textColor = .black
        return placeHolder
    }()
    
    //key input
    private lazy var inputField: UITextField = {
        let inputField = UITextField()
        inputField.backgroundColor = .systemBackground
        inputField.returnKeyType = .done
        inputField.autocorrectionType = .no
        inputField.autocapitalizationType = .none
        inputField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        return inputField
    }()
    
   // bottom line
    private lazy var bottomLine: UIView = {
        let bottomLine = UIView()
        bottomLine.backgroundColor = .black
        bottomLine.height(1)
        return bottomLine
    }()
    
    // text count lable
    private lazy var textCountLableView: UILabel = {
        let textCountLableView = UILabel()
        textCountLableView.text = "\(textCount)/9"
        textCountLableView.font = UIFont(name: "Roboto-Bold", size: 12)
        textCountLableView.textColor = .black
        return textCountLableView
    }()
    
    
    // submit button
    private lazy var submitButton: CustomButton = {
        let submitButton = CustomButton(hasBackground: true, title: "Submit", buttonType: .medium)
        submitButton.backgroundColor = APPThemeColor.disabledButtonBackground
        submitButton.setTitleColor(APPThemeColor.disabledButtonTitle, for: [])
        submitButton.isUserInteractionEnabled = false
        submitButton.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        return submitButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.hidesBackButton = true
        configureUI()
    }
    
    func configureUI(){
        
        // title and discription stack
        let titleAndDiscriptionStack = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        titleAndDiscriptionStack.axis = .vertical
        titleAndDiscriptionStack.alignment = .fill
        titleAndDiscriptionStack.distribution = .fill
        titleAndDiscriptionStack.spacing = 60
        
        self.view.addSubview(titleAndDiscriptionStack)
        titleAndDiscriptionStack.topToSuperview(offset: 34, usingSafeArea: true)
        titleAndDiscriptionStack.leftToSuperview(offset: 16)
        titleAndDiscriptionStack.rightToSuperview(offset: -16)
        
        
        // placeholder and input field stack
        let keyinputView = UIStackView(arrangedSubviews: [placeHolder, inputField])
        keyinputView.axis = .vertical
        keyinputView.alignment = .fill
        keyinputView.distribution = .fill
        keyinputView.spacing = 10
        
        self.view.addSubview(keyinputView)
        keyinputView.topToBottom(of:titleAndDiscriptionStack, offset: 50)
        keyinputView.leftToSuperview(offset: 16)
        keyinputView.rightToSuperview(offset: -16)
        
        
        // input bottom line
        self.view.addSubview(bottomLine)
        bottomLine.topToBottom(of:keyinputView, offset: 10)
        bottomLine.leftToSuperview(offset: 16)
        bottomLine.rightToSuperview(offset: -16)
        
        self.view.addSubview(textCountLableView)
        textCountLableView.topToBottom(of: bottomLine, offset: 12)
        textCountLableView.right(to: bottomLine)
        
        self.view.addSubview(submitButton)
        submitButton.bottomToSuperview(offset:-200, usingSafeArea: true)
        submitButton.centerXToSuperview()
    }
    
    // function to handle the input value change
        @objc func handleTextChange (){
            textCount = inputField.text?.count ?? 0
            textCountLableView.text = "\(textCount)/9"
            if(textCount == 9){
                submitButton.backgroundColor =  APPThemeColor.buttonBackground
                submitButton.setTitleColor(APPThemeColor.buttonTitle, for: [])
                submitButton.isUserInteractionEnabled = true
            }else{
                submitButton.backgroundColor = APPThemeColor.disabledButtonBackground
                submitButton.setTitleColor(APPThemeColor.disabledButtonTitle, for: [])
                submitButton.isUserInteractionEnabled = false
            }
            print(textCount)
        }
    
    // function to handle submit button
        @objc func handleSubmit(){
            let vc = HomescreenViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
}
