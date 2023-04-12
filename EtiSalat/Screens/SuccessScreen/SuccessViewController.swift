//
//  SuccessViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/17/23.
//

import UIKit

class SuccessViewController: UIViewController {
    
    private var viewModel = SuccessViewModel()
    
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
        image.image = UIImage(named: "successScreenImge")
        return image
    }()
    
    private lazy var titleLabel: LabelTheme = {
        let titleLabel = LabelTheme()
        titleLabel.text = viewModel.getTitles(for: .SuccessTitle)
        titleLabel.textTheme = .titleText
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    private lazy var descriptionLabel: LabelTheme = {
        let descriptionLabel = LabelTheme()
        descriptionLabel.text = viewModel.getTitles(for: .SuccessDescription)
        descriptionLabel.textTheme = .descriptionText
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    private lazy var doneButton: ButtonTheme = {
        let doneButton = ButtonTheme()
        doneButton.setTitle(viewModel.getTitles(for: .SuccessButtonTitle), for: [])
        doneButton.buttonTheme = .enabled
        doneButton.addTarget(self, action: #selector(handleDone), for: .touchUpInside)
        return doneButton
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
        
        self.contentView.addSubview(doneButton)
        doneButton.centerXToSuperview()
        doneButton.width(107)
        doneButton.height(34)
        doneButton.topToBottom(of: imageLabelStackView, offset: 45)
    }
    
    @objc func handleDone (){
        print("done")
        let vc = HomescreenViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
