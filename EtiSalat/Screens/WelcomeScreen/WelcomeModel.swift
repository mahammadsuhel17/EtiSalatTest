//
//  WelcomeModel.swift
//  Allot
//
//  Created by Mani Deepika J M on 3/30/23.
//

import Foundation

enum Welcome {
    case welcomeTitle
    case welcomeDescription
    case welcomeButtonTitle
    case defaultLinkTitle
    case licenseAgreementLinkTitle
    case privacyTermsLinkTitle
    case alertTitle
    case alertDescription
    
    var text: String {
        switch self {
        case .welcomeTitle: return "Welcome_Label_Title".localized()
        case .welcomeDescription : return "Welcome_Label_Description".localized()
        case .welcomeButtonTitle: return "Welcome_Button_Title".localized()
        case .defaultLinkTitle: return "Welcome_Label_Agree".localized()
        case .licenseAgreementLinkTitle: return "Welcome_Label_License_Agreement".localized()
        case .privacyTermsLinkTitle: return "Welcome_Label_Privacy_Terms".localized()
        case .alertTitle: return "Welcome_Alert_Title_Label".localized()
        case .alertDescription: return "Welcome_Alert_Description_Label".localized()
        }
    }
}

enum welcomeCheckbox  {
    case dimension
    
    var dimension: CGFloat {
        switch self {
        case .dimension: return 36
        }
    }
}
