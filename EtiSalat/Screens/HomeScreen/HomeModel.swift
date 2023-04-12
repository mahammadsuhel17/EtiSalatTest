//
//  HomeModel.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 4/5/23.
//

import Foundation

enum Home {
    case HomeTitle
    case HomeDescription
    case HomeTermsButtonTitle
    case HomeAboutButtonTitle
    
    var text: String {
        switch self {
        case .HomeTitle : return "Home_Lable_Title".localized()
        case .HomeDescription : return "Home_Lable_Discription".localized()
        case .HomeAboutButtonTitle : return "HOME_Label_About_Button_Title".localized()
        case .HomeTermsButtonTitle : return "Home_Lable_Terms_button_title".localized()
        }
    }
}
