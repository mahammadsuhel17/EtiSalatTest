//
//  VPNModel.swift
//  Allot
//
//  Created by Mani Deepika J M on 3/30/23.
//

import Foundation

enum VPN {
    case VPNTitle
    case VPNDescription
    case VPNButtonTitle
   
    var text: String {
        switch self {
        case .VPNTitle: return "VPN_Label_Title".localized()
        case .VPNDescription : return "VPN_Label_Description".localized()
        case .VPNButtonTitle: return "VPN_Button_Title".localized()
        }
    }
}
