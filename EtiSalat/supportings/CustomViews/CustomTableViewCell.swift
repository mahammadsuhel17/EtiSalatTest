//
//  CustomTableViewCell.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/17/23.
//

import TinyConstraints

class CustomTableViewCell: UITableViewCell {

    var tableTitle = UILabel()
    var tableSubTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let cellLabelStack = UIStackView(arrangedSubviews: [tableTitle, tableSubTitle])
        cellLabelStack.axis = .vertical
        cellLabelStack.alignment = .fill
        cellLabelStack.distribution = .fill
        cellLabelStack.spacing = 7
        
        self.addSubview(cellLabelStack)
        cellLabelStack.leftToSuperview(offset: 16)
        tableTitle.font = .systemFont(ofSize: 16, weight: .bold)
        tableSubTitle.font = .systemFont(ofSize: 14, weight: .regular)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    }

