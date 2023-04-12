//
//  NSAttributedStringExtension.swift
//  Allot
//
//  Created by Mani Deepika J M on 3/30/23.
//

import Foundation

extension NSAttributedString {
    static func + (left: NSAttributedString, right: NSAttributedString) -> NSAttributedString {
        let result = NSMutableAttributedString()
        result.append(left)
        result.append(right)
        return result
    }
}
