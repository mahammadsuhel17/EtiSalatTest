//
//  LoaderViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 4/4/23.
//

import UIKit
import TinyConstraints

class LoaderViewController: UIViewController {
    
    private lazy var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.hidesWhenStopped = true
        loader.startAnimating()
        loader.style = .large
        loader.color = APPThemeColor.buttonBackground
        return loader
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white.withAlphaComponent(0.8)
        setUpLoader()
    }
    
    func setUpLoader (){
        view.addSubview(loader)
        loader.centerXToSuperview()
        loader.centerYToSuperview()
    }
    

}
