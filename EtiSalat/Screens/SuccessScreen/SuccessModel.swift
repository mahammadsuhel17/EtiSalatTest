//
//  SuccessModel.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 4/5/23.
//

import Foundation

enum Success {
    case SuccessTitle
    case SuccessDescription
    case SuccessButtonTitle
    
    var text: String {
        switch self {
        case .SuccessTitle: return "SuccessLableTitle".localized()
        case .SuccessDescription: return "SuccessDescription".localized()
        case .SuccessButtonTitle: return "SuccessButtonTitle".localized()
        }
    }
}

