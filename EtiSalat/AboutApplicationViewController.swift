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
        data(title: "Android/iOS version", subTitle: "9.1.0"),
        data(title: "Android API Level", subTitle: "17778.99"),
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
        titleLabel.text = "This information might be needed when you contact support."
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
        navigationItem.title = "About the Application"
        configureUI()
    }
    
    func configureUI (){
        self.view.addSubview(titleLabel)
        titleLabel.topToSuperview(offset: 50, usingSafeArea: true)
        titleLabel.leftToSuperview(offset: 16)
        
        configureTableView()
        
        let bottomView = UIStackView(arrangedSubviews: [logoView, bottomText])
        bottomView.axis = .vertical
        bottomView.distribution = .fill
        bottomView.alignment = .fill
        bottomView.spacing = 12
        
        self.view.addSubview(bottomView)
        bottomView.width(150)
        bottomView.bottomToSuperview(offset: -16, usingSafeArea: true)
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
    }


    
