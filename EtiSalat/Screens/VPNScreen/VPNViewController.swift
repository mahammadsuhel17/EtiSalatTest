//
//  VPNViewController.swift
//  Allot
//
//  Created by Mani Deepika J M on 3/29/23.
//

import UIKit
import TinyConstraints

class VPNViewController: UIViewController {
    
    /// get or set viewModel
    private var viewModel = VPNViewModel()

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
    
    ///  set navigation view
    private lazy var navBar: UIView = {
        let navBar = UIView()
        return navBar
    }()
    /// set back button
    private lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.width(30)
        backButton.height(30)
        backButton.setImage(UIImage(named: "back"), for: [])
        backButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapOnBackButton)))
        return backButton
    }()
    ///  set welcome image
    private lazy var vpnImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "VPN")
        return image
    }()
    ///  set title label
    private lazy var titleLabel: LabelTheme = {
        let titleLabel = LabelTheme()
        titleLabel.text = viewModel.getTitles(for: .VPNTitle)
        titleLabel.textTheme = .titleText
        return titleLabel
    }()
    /// set description label
    private lazy var descriptionLabel: LabelTheme = {
        let descriptionLabel = LabelTheme()
        descriptionLabel.text = viewModel.getTitles(for: .VPNDescription)
        descriptionLabel.textTheme = .descriptionText
        return descriptionLabel
    }()
    /// set agree button
    private lazy var installButton: ButtonTheme = {
        let installButton = ButtonTheme()
        installButton.setTitle(viewModel.getTitles(for: .VPNButtonTitle), for: [])
        installButton.buttonTheme =  .enabled
        installButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapOnInstallButton)))
        return installButton
    }()

    //MARK: didload
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    //MARK: view will appear
    override func viewWillAppear(_ animated: Bool) {
        configureUI()
    }
    
    func configureUI() {
    
        ///set navBar
        view.addSubview(navBar)
        navBar.topToSuperview(offset: 29, usingSafeArea: true)
        navBar.leadingToSuperview(offset: 0, usingSafeArea: true)
        navBar.trailingToSuperview(offset: 0, usingSafeArea: true)
        navBar.height(34)
        ///set back button
        navBar.addSubview(backButton)
        backButton.leading(to: navBar, offset: 20)
        
        ///set scrollview
        view.addSubview(scrollView)
        scrollView.topToBottom(of: navBar)
        scrollView.edgesToSuperview(excluding: [.top])
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y), animated: true)
        self.scrollView.isDirectionalLockEnabled  = true
        
        ///add content view on scrollview
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.width(to: scrollView)
        
        ///  set view for imageview
        let imageHolderView = UIView()
        imageHolderView.addSubview(vpnImage)
        vpnImage.centerInSuperview()
        imageHolderView.height(260)
        
        /// set stackview for labels
        let labelStackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        labelStackView.axis = .vertical
        labelStackView.distribution = .fill
        labelStackView.alignment = .fill
        labelStackView.spacing = 16
        
        /// set stackview for image  and labels
        let imageLabelStackView = UIStackView(arrangedSubviews: [imageHolderView, labelStackView])
        imageLabelStackView.axis = .vertical
        imageLabelStackView.distribution = .fill
        imageLabelStackView.alignment = .fill
        imageLabelStackView.spacing = 16

        self.contentView.addSubview(imageLabelStackView)
        imageLabelStackView.topToSuperview(offset: 10)
        imageLabelStackView.edgesToSuperview(excluding: [.top, .bottom], insets: UIEdgeInsets(top: 0, left: 26, bottom: 0, right: 26))

        ///set install Button
        self.contentView.addSubview(installButton)
        installButton.width(107)
        installButton.height(34)
        installButton.centerXToSuperview()
        installButton.topToBottom(of: imageLabelStackView, offset: 30)
        installButton.edgesToSuperview(excluding: [.top, .left, .right], insets: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0))
        
    }
    
    //MARK: back button pressed
    @objc func didTapOnBackButton() {
        self.dismiss(animated: true)
    }

    //MARK: install button pressed
    @objc func didTapOnInstallButton() {
        print("tab")
        let nextVC = ActivationViewController()
        nextVC.modalPresentationStyle =  .fullScreen
        self.present(nextVC, animated: true)
    }
  

}
