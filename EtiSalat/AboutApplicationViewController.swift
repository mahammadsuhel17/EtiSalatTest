//
//  AboutApplicationViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/17/23.
//

import TinyConstraints

class AboutApplicationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    struct data {
        var title : String
        var subTitle : String
    }
    
    let tableData = [
        data(title: "SDK Version number", subTitle: "Keepers SDK version"),
        data(title: "App version", subTitle: "7.1.0.6.9"),
        data(title: "Phone Model (manufacturer)", subTitle: "9.1.0.255"),
        data(title: "iOS version", subTitle: "9.1.0"),
        data(title: "iOS API Level", subTitle: "17778.99"),
        data(title: "Product name", subTitle: "Product name"),
        data(title: "Copy-right notice", subTitle: "Copyright@2023"),
        data(title:"Device_Id", subTitle:"9.1.0.235"),
        data(title:"Device_Name", subTitle:"Huawei VKY-L289")
    ]
    
//    var tableView = UITableView()
//    var logoView = UIImageView()
//    var bottomText = UILabel()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "ABOUT_LABEL_SUB_TITLE".localized()
        titleLabel.font = UIFont(name: "Roboto-Regular", size: 14)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        return titleLabel
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 52
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var supportButton: UIButton = {
        let supportButton = UIButton()
        supportButton.setTitle("ABOUT_LABEL_CUSTOMER_SUPPORT".localized(), for: .normal)
        supportButton.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 14)
        supportButton.height(40)
        supportButton.width(200)
        supportButton.setTitleColor(UIColor.black, for: .normal)
        supportButton.addTarget(self, action: #selector(handelSupprt), for: .touchUpInside)
        return supportButton
    }()
    
    private lazy var bottomLine: UIView = {
        let bottomLine = UIView()
        bottomLine.height(1)
        bottomLine.backgroundColor = .black
        return bottomLine
    }()
    
    private lazy var logoView: UIImageView = {
        let logoView = UIImageView()
        logoView.image = UIImage(named: "logo")
        return logoView
    }()
    
    
    
    private lazy var bottomText: UILabel = {
        let bottomText = UILabel()
        bottomText.text = "Copyright 2023Etisalat Inc. All rights reserved"
        bottomText.font = UIFont(name: "Roboto-Regular", size: 12)
        bottomText.numberOfLines = 0
        bottomText.textColor = .black
        bottomText.textAlignment = .center
        return bottomText
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "ABOUT_LABEL_TITLE".localized()
        configureUI()
    }
    
    func configureUI (){
        self.view.addSubview(titleLabel)
        titleLabel.topToSuperview(offset: 50, usingSafeArea: true)
        titleLabel.leftToSuperview(offset: 16)
        
        configureTableView()
        
        self.view.addSubview(supportButton)
        supportButton.topToBottom(of:tableView, offset: -30 )
        supportButton.centerXToSuperview()
        supportButton.addSubview(bottomLine)
        bottomLine.topToBottom(of: supportButton, offset: -12)
        bottomLine.width(120)
        bottomLine.centerXToSuperview()
        
        let bottomView = UIStackView(arrangedSubviews: [logoView, bottomText])
        bottomView.axis = .vertical
        bottomView.distribution = .fill
        bottomView.alignment = .fill
        bottomView.spacing = 12
        
        self.view.addSubview(bottomView)
        bottomView.width(150)
        bottomView.topToBottom(of: supportButton ,offset: 45)
        bottomView.centerXToSuperview()
    }
    
    func configureTableView (){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 52
        tableView.separatorStyle = .none
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo:  titleLabel.bottomAnchor, constant: 20),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -150),
            ])

    }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tableData.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
            let tableText = tableData[indexPath.row]
            cell.tableTitle.text = tableText.title
            cell.tableSubTitle.text = tableText.subTitle
            return cell
        }
    
        @objc func handelSupprt(){

        }
    }




    
