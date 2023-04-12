//
//  AppWebViewViewController.swift
//  Allot
//
//  Created by Mani Deepika J M on 3/28/23.
//

import UIKit
import WebKit

class AppWebViewViewController: UIViewController {
    
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
    /// set webview
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    
    //MARK: Declarations
    var urlString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor  =  .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cofigureUI()
    }
    
    func cofigureUI()  {
        ///set navBar
        view.addSubview(navBar)
        navBar.topToSuperview(offset: 29, usingSafeArea: true)
        navBar.leadingToSuperview(offset: 0, usingSafeArea: true)
        navBar.trailingToSuperview(offset: 0, usingSafeArea: true)
        navBar.height(34)
        ///set back button
        navBar.addSubview(backButton)
        backButton.leading(to: navBar, offset: 10)
        
        //set webview
        self.view.addSubview(webView)
        webView.navigationDelegate = self
        webView.topToBottom(of: navBar)
        webView.edgesToSuperview(excluding: [.top])
        DispatchQueue.main.async { [self] in
            webView.load(URLRequest(url:URL(string: urlString)!))
        }
        
    }
    
    //MARK: back button pressed
    @objc func didTapOnBackButton() {
        self.dismiss(animated: true)
    }
    
}

extension AppWebViewViewController: WKNavigationDelegate {
    
}
