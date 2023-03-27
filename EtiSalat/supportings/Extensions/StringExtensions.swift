//
//  StringExtensions.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/27/23.
//

import Foundation
import UIKit

extension String {
    func localized(withComment:String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: withComment)
    }
    
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
