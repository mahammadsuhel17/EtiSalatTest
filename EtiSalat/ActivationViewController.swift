//
//  ActivationViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/15/23.
//

import UIKit

class ActivationViewController: UIViewController {
    
    var boldText = UILabel()
    var bodyText = UILabel()
    let buttonColor = UIColor(hexString: "#f657gy")
    var inputField = UITextField()
    var bottomLine = UIView()
    var placeholder = UILabel()
    var textcount = UILabel()
    var submitButton = CustomButton(hasBackground: true, title: "Submit", buttonType: .medium)
    var loader = UIActivityIndicatorView()
    var checkImage = UIImageView()
    
    var popUp = PopUp()
    
    var textCount = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Activate the service"
        configureUI()
    }
    
    func configureUI(){
        configureBoldText()
        configureBodyText()
        configureInputField()
        configureSubmitButoon()
        configurePopup()
        configureTextCount()
//        configureLoader()
    }
    
    func configureBoldText (){
        view.addSubview(boldText)
        boldText.text = "Enter the key"
        boldText.translatesAutoresizingMaskIntoConstraints = false
        boldText.font = .systemFont(ofSize: 16, weight: .bold)
        NSLayoutConstraint.activate([
            boldText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            boldText.topAnchor.constraint(equalTo: view.topAnchor, constant: 96),
        ])
    }
    
    func configureBodyText (){
        view.addSubview(bodyText)
        bodyText.translatesAutoresizingMaskIntoConstraints = false
        bodyText.text = "The activation key was sent to you. If you cannot find it, please login to the parent portal and go to “Devices”."
        bodyText.font = .systemFont(ofSize: 14, weight: .regular)
        bodyText.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            bodyText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bodyText.topAnchor.constraint(equalTo: boldText.bottomAnchor, constant: 16),
            bodyText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
        ])
    }
    
    func configureInputField(){
        view.addSubview(inputField)
        inputField.translatesAutoresizingMaskIntoConstraints = false
        inputField.backgroundColor = .systemBackground
        inputField.returnKeyType = .done
        inputField.autocorrectionType = .no
        inputField.autocapitalizationType = .none
        inputField.leftViewMode = .always
        inputField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: inputField.frame.size.height))
        inputField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        
        inputField.addSubview(placeholder)
        placeholder.translatesAutoresizingMaskIntoConstraints = false
        placeholder.text = "Enter Key"
        placeholder.font = .systemFont(ofSize:12, weight: .bold)
        
        inputField.addSubview(bottomLine)
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.backgroundColor = .black
        
        inputField.addSubview(loader)
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.stopAnimating()
        
        inputField.addSubview(checkImage)
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        checkImage.tintColor = .red
        checkImage.image = UIImage(systemName: "checkmark")
        checkImage.isHidden = true
        
        
        
        NSLayoutConstraint.activate([
            inputField.topAnchor.constraint(equalTo: bodyText.bottomAnchor, constant: 12),
            inputField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            inputField.heightAnchor.constraint(equalToConstant: 65),
            inputField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
            placeholder.leadingAnchor.constraint(equalTo: inputField.leadingAnchor),
            placeholder.topAnchor.constraint(equalTo: inputField.topAnchor, constant: 0),

            
            bottomLine.heightAnchor.constraint(equalToConstant: 1),
            bottomLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            bottomLine.topAnchor.constraint(equalTo: inputField.bottomAnchor, constant: -10),
            bottomLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
            loader.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            loader.centerYAnchor.constraint(equalTo: inputField.centerYAnchor),
            
            checkImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            checkImage.centerYAnchor.constraint(equalTo: inputField.centerYAnchor)
            
        ])
    }
    
    func configureTextCount (){
        view.addSubview(textcount)
        textcount.translatesAutoresizingMaskIntoConstraints = false
        textcount.text = "\(textCount)/9"
    
        
        NSLayoutConstraint.activate([
            textcount.topAnchor.constraint(equalTo: bottomLine.bottomAnchor, constant: 5),
            textcount.rightAnchor.constraint(equalTo: view.rightAnchor, constant:  -16),
        ])
    }
    
    func configureSubmitButoon (){
        view.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        submitButton.isUserInteractionEnabled = textCount >= 9 ? true : false
        submitButton.backgroundColor = !submitButton.isUserInteractionEnabled ? .lightGray : .red
        NSLayoutConstraint.activate([
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        ])
    }
    
    func configurePopup(){
        view.addSubview(popUp)
        popUp.buttonview1.addTarget(self, action: #selector(handleOk), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            popUp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popUp.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popUp.heightAnchor.constraint(equalTo: view.heightAnchor),
            popUp.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }

    
    @objc func handleTextChange (){
        textCount = inputField.text?.count ?? 0
        configureSubmitButoon()
        if(textCount == 9){
            loader.startAnimating()
        }else{
            loader.stopAnimating()
        }
        if(textCount != 9){
            checkImage.isHidden = true
        }
        if(textCount <= 9){
            textcount.text = "\(textCount)/9"
        }
    }
    
    @objc func handleSubmit(){
            loader.stopAnimating()
            checkImage.isHidden = false
        
    }
    
    @objc func handleOk(){
        popUp.handleHide()
    }
    
}
