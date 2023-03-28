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

//    set navigation view
       private lazy var navBar: UIView = {
           let navBar = UIView()
           return navBar
       }()
    
    ///  set navigation label
       private lazy var navigationLabel: UILabel = {
           let navigationLabel = UILabel()
           navigationLabel.text = "Activation_Navigation_Label".localized()
           navigationLabel.font = APPFont.title
           navigationLabel.textColor = APPThemeColor.title
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
//        inputField.returnKeyType = .done
        inputField.autocorrectionType = .no
        inputField.autocapitalizationType = .none
        inputField.placeholder = "enter key"
        inputField.height(60)
//        inputField.returnKeyType = .default
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
//        navigationItem.hidesBackButton = true
//        initializeHideKeyboard()
        configureUI()
    }

    func configureUI(){

        view.addSubview(scrollView)
        scrollView.leadingToSuperview()
        scrollView.trailingToSuperview()
        scrollView.topToSuperview()
        scrollView.bottomToSuperview()
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y), animated: true)
        self.scrollView.isDirectionalLockEnabled  = true
        
        //add content view on scrollview
        scrollView.addSubview(contentView)
        contentView.leading(to: scrollView)
        contentView.trailing(to: scrollView)
        contentView.top(to: scrollView)
        contentView.bottom(to: scrollView)
        contentView.width(to: scrollView)

        // title and discription stack
        let titleAndDiscriptionStack = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        titleAndDiscriptionStack.axis = .vertical
        titleAndDiscriptionStack.alignment = .fill
        titleAndDiscriptionStack.distribution = .fill
        titleAndDiscriptionStack.spacing = 60

        self.contentView.addSubview(titleAndDiscriptionStack)
        titleAndDiscriptionStack.top(to: scrollView, offset: 34)
        titleAndDiscriptionStack.leftToSuperview(offset: 16)
        titleAndDiscriptionStack.rightToSuperview(offset: -16)

//        inputField.height(50)
        // placeholder and input field stack
        let keyinputView = UIStackView(arrangedSubviews: [placeHolder, inputField])
        keyinputView.axis = .vertical
        keyinputView.alignment = .fill
        keyinputView.distribution = .fill
        keyinputView.spacing = 10
        

        self.contentView.addSubview(keyinputView)
        keyinputView.topToBottom(of:titleAndDiscriptionStack, offset: 50)
        keyinputView.leftToSuperview(offset: 16)
        keyinputView.rightToSuperview(offset: -16)


        // input bottom line
        self.contentView.addSubview(bottomLine)
        bottomLine.topToBottom(of:keyinputView, offset: 10)
        bottomLine.leftToSuperview(offset: 16)
        bottomLine.rightToSuperview(offset: -16)

        self.contentView.addSubview(textCountLableView)
        textCountLableView.topToBottom(of: bottomLine, offset: 12)
        textCountLableView.right(to: bottomLine)

        self.contentView.addSubview(submitButton)
        submitButton.topToBottom(of: textCountLableView, offset: 150)
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
            let vc = SuccessViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }

    func initializeHideKeyboard(){
     //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
     let tap: UITapGestureRecognizer = UITapGestureRecognizer(
     target: self,
     action: #selector(dismissMyKeyboard))
     //Add this tap gesture recognizer to the parent view
     view.addGestureRecognizer(tap)
     }
     @objc func dismissMyKeyboard(){
     //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
     //In short- Dismiss the active keyboard.
     view.endEditing(true)
     }
}

//class ActivationViewController: UIViewController {
//
//
//    override func viewWillAppear(_ animated: Bool) {
//      configureUI()
//    }
//
//    func configureUI() {
//
//        ///set navBar
//        view.addSubview(navBar)
//        navBar.topToSuperview(offset: 34, usingSafeArea: true)
//        navBar.leadingToSuperview(offset: 0, usingSafeArea: true)
//        navBar.trailingToSuperview(offset: 0, usingSafeArea: true)
//        navBar.height(34)
//        ///set navigation title
//        navBar.addSubview(navigationLabel)
//        navigationLabel.leading(to: navBar, offset: 26)
//        navigationLabel.trailing(to: navBar, offset: 26)
//
//        ///set scrollview
//        view.addSubview(scrollView)
//        scrollView.backgroundColor = .green
//        scrollView.leadingToSuperview()
//        scrollView.trailingToSuperview()
//        scrollView.topToBottom(of: navBar, offset: 20)
//        scrollView.bottomToSuperview()
//        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y), animated: true)
//        self.scrollView.isDirectionalLockEnabled  = true
//
//        ///add content view on scrollview
//        scrollView.addSubview(contentView)
//        contentView.leading(to: scrollView)
//        contentView.trailing(to: scrollView)
//        contentView.top(to: scrollView)
//        contentView.bottom(to: scrollView)
//        contentView.width(to: scrollView)
//
//        /// set stackview for labels
//        let labelStackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
//        labelStackView.axis = .vertical
//        labelStackView.distribution = .fill
//        labelStackView.alignment = .fill
//        labelStackView.spacing = 19
//
//        self.contentView.addSubview(labelStackView)
//        labelStackView.topToSuperview(offset: 24, usingSafeArea: true)
//        labelStackView.leftToSuperview(offset: 16)
//        labelStackView.rightToSuperview(offset: -16)
//
//    }
//
//
//}
