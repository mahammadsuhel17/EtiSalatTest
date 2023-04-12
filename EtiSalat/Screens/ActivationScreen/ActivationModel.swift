//
//  ActivationModel.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 4/5/23.
//

import Foundation
enum activation {
    case ActivationTitle
    case ActivationDescription
    case ActivationPlaceholder
    case ActivationButtonTitle
    case ActivationExpireAlertTitle
    case ActivationExpireAlertDiscripton
    case ActivationIncorrectAlerTitle
    case ActivationIncorrectAlerDiscripton
    case ActivationAlerButtomnTitle
   
    var text: String {
        switch self {
        case .ActivationTitle: return "Activation_Heading_Label_Title".localized()
        case .ActivationDescription : return "Activation_Label_Description".localized()
        case .ActivationPlaceholder : return "Activation_PlaceHolder".localized()
        case .ActivationButtonTitle : return "Activation_Button_Title".localized()
        case .ActivationExpireAlertTitle : return "Activation_Alert_Key_Expired_Title".localized()
        case .ActivationExpireAlertDiscripton : return "Activation_Alert_Key_Expired_Description".localized()
        case .ActivationIncorrectAlerTitle : return "Activation_Alert_IncorrectKey_Title".localized()
        case .ActivationIncorrectAlerDiscripton : return "ActivationIncorrectAlerDiscripton".localized()
        case .ActivationAlerButtomnTitle : return "Activation_Alert_Button_Ok".localized()
        }
    }
}
