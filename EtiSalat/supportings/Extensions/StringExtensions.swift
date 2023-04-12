//
//  StringExtensions.swift
//  Allot
//
//  Created by Mani Deepika J M on 3/16/23.
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
