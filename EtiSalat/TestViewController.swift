//
//  TestViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/23/23.
//

import TinyConstraints

class TestViewController: UIViewController {
    let screenIamge = UIImageView()
//    private lazy var welcomeImage: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "WelcomeScreenImage")
//        return image
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    func configureUI(){
        configureScreenImage()
    }
    
    func configureScreenImage(){
        view.addSubview(screenIamge)
        screenIamge.image = UIImage(named: "WelcomeScreenImage")
        screenIamge.centerXToSuperview()
        screenIamge.topToSuperview(offset: 75, usingSafeArea: true)
        screenIamge.height(230)
        screenIamge.width(230)
        
    }
    
}
