//
//  AboutApplicationViewController.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/17/23.
//

import UIKit

class AboutApplicationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var bodyText = UILabel()
    var tableView = UITableView()
    var logoView = UIImageView()
    var bottomText = UILabel()
    
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


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "About the Application"
        configureUI()
    }
    func configureUI (){
        configureBodyText()
        configureTableView()
        configureLogoView()
        configureBottomText()
    }
    func configureBodyText (){
        view.addSubview(bodyText)
        bodyText.translatesAutoresizingMaskIntoConstraints = false
        bodyText.text = "This information might be needed when you contact support."
        bodyText.textAlignment = .left
        bodyText.font = .systemFont(ofSize: 16, weight: .regular)
        bodyText.numberOfLines = 0

        NSLayoutConstraint.activate([
            bodyText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bodyText.topAnchor.constraint(equalTo:  view.topAnchor, constant: 100),
            bodyText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            bodyText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
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
            tableView.topAnchor.constraint(equalTo:  bodyText.bottomAnchor, constant: 20),
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
    
    func configureLogoView (){
        view.addSubview(logoView)
        logoView.image = UIImage(named: "logo")
        logoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 32),
            logoView.widthAnchor.constraint(equalToConstant: 110),
            logoView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110)
        ])
    }
    
    func configureBottomText (){
        
        view.addSubview(bottomText)
        bottomText.translatesAutoresizingMaskIntoConstraints = false
        bottomText.text = "Copyright 2023Etisalat Inc. All rights reserved"
        bottomText.textAlignment = .center
        bottomText.font = .systemFont(ofSize: 16, weight: .regular)
        bottomText.numberOfLines = 0

        NSLayoutConstraint.activate([
            bottomText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomText.topAnchor.constraint(equalTo:  logoView.bottomAnchor, constant: 10),
            bottomText.widthAnchor.constraint(equalToConstant: 200)
        ])

        
    }
    
    
    
    }


    
