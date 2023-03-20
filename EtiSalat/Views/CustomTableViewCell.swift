//
//  CustomTableViewCell.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/17/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var tableTitle = UILabel()
    var tableSubTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(tableTitle)
        tableTitle.translatesAutoresizingMaskIntoConstraints = false
        tableTitle.font = .systemFont(ofSize: 16, weight: .bold)
        addSubview(tableSubTitle)
        tableSubTitle.translatesAutoresizingMaskIntoConstraints = false
        tableSubTitle.font = .systemFont(ofSize: 14, weight: .regular)
        
        
        NSLayoutConstraint.activate([
            tableTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            tableTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            
            tableSubTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            tableSubTitle.topAnchor.constraint(equalTo: tableTitle.bottomAnchor, constant: 5)
        ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    }

