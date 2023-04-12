//
//  popUpViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/17/23.
//

import TinyConstraints

class popUpViewController: UIViewController {
    var alertView = UIView()
    var buttonview1 = UIButton()
    

    public lazy var popUpTitle: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: "Roboto-Bold", size: 22)
        titleLabel.textColor = .black
        return titleLabel
    }()

    public lazy var subTitle: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont(name: "Roboto-Regular", size: 12)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .black
        return descriptionLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.backgroundColor = .black.withAlphaComponent(0.6)
        configureUI()
    }
    func configureUI(){
        
        view.addSubview(alertView)
        alertView.backgroundColor = .systemBackground
        alertView.layer.cornerRadius = 12
        alertView.height(200)
        alertView.centerInSuperview()
        alertView.width(280)
        
        let titleAndSubTitleStack = UIStackView(arrangedSubviews: [popUpTitle, subTitle])
        titleAndSubTitleStack.axis = .vertical
        titleAndSubTitleStack.distribution = .fill
        titleAndSubTitleStack.alignment = .fill
        titleAndSubTitleStack.spacing = 16

        
        view.addSubview(titleAndSubTitleStack)
        titleAndSubTitleStack.top(to: alertView, offset: 30)
        titleAndSubTitleStack.left(to: alertView, offset: 24)
        titleAndSubTitleStack.right(to: alertView, offset: -24)
        
        view.addSubview(buttonview1)
        buttonview1.translatesAutoresizingMaskIntoConstraints = false
        buttonview1.configuration = .filled()
        buttonview1.configuration?.baseBackgroundColor = .clear
        buttonview1.configuration?.baseForegroundColor = .black
        buttonview1.configuration?.title = "Continue"
        buttonview1.topToBottom(of: titleAndSubTitleStack, offset: 36)
        buttonview1.right(to: alertView, offset: -24)
    }
}
