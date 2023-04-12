//
//  HomescreenViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/17/23.
//

import TinyConstraints

class HomescreenViewController: UIViewController {
    private var viewModel = HomeViewModel()
    let relativeContrains : CGFloat = 0.060
    
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
    
    private lazy var screenImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "homeScreenImage")
        return image
    }()
    
    private lazy var titleLabel: LabelTheme = {
        let titleLabel = LabelTheme()
        titleLabel.text = viewModel.getTitles(for: .HomeTitle)
        titleLabel.textTheme = .titleText
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    private lazy var descriptionLabel: LabelTheme = {
        let descriptionLabel = LabelTheme()
        descriptionLabel.text = viewModel.getTitles(for: .HomeDescription)
        descriptionLabel.textTheme = .descriptionText
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    private lazy var aboutButton: ButtonTheme = {
        let aboutButton = ButtonTheme()
        aboutButton.setTitle(viewModel.getTitles(for: .HomeAboutButtonTitle), for: [])
        aboutButton.backgroundColor = .clear
        aboutButton.setTitleColor(UIColor(hexString: "#000000"), for: .normal)
        aboutButton.height(40)
        aboutButton.width(200)
        aboutButton.addTarget(self, action: #selector(handelAbout), for: .touchUpInside)
        return aboutButton
    }()
    
    private lazy var termsButton: ButtonTheme = {
        let termsButton = ButtonTheme()
        termsButton.setTitle(viewModel.getTitles(for: .HomeTermsButtonTitle), for: [])
        termsButton.backgroundColor = .clear
        termsButton.setTitleColor(UIColor(hexString: "#000000"), for: .normal)
        termsButton.height(40)
        termsButton.width(200)
        termsButton.addTarget(self, action: #selector(handelTerms), for: .touchUpInside)
        return termsButton
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
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
        contentView.height(to: scrollView)
        
        
        let imageHolderView = UIView()
        self.contentView.addSubview(imageHolderView)
        imageHolderView.addSubview(screenImage)
        screenImage.centerInSuperview()
        imageHolderView.height(230)
        
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
        
        self.contentView.addSubview(imageLabelStackView)
        imageLabelStackView.topToSuperview(offset: 10)
        imageLabelStackView.edgesToSuperview(excluding: [.top, .bottom], insets: UIEdgeInsets(top: 0, left: 26, bottom: 0, right: 26))
        
        
        let textbuttonStackView = UIStackView(arrangedSubviews:[termsButton, aboutButton])
        textbuttonStackView.axis = .vertical
        textbuttonStackView.distribution = .fill
        textbuttonStackView.alignment = .fill
        textbuttonStackView.spacing = 10
        
        self.contentView.addSubview(textbuttonStackView)
        textbuttonStackView.centerXToSuperview()
        textbuttonStackView.topToBottom(of: imageLabelStackView, offset: 80)
    }
    
        @objc func handelAbout(){
            let vc = AboutApplicationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    
        @objc func handelTerms(){
    
        }
}
