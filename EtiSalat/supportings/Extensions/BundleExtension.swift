//
//  BundleExtension.swift
//  Allot
//
//  Created by Mani Deepika J M on 3/27/23.
//

import Foundation
import UIKit

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}

//print("version Number:- \(Bundle.main.releaseVersionNumber as Any)")
//print("Build Number:- \(Bundle.main.buildVersionNumber as Any)")
//
//let deviceVersion = UIDevice.current.systemVersion
//print("deviceVersion:- \(deviceVersion)")
//let deviceName = UIDevice.current.name
//print("deviceName:- \(deviceName)")
//let deviceId = UIDevice.current.identifierForVendor!.uuidString
//print("deviceId:- \(deviceId)")
