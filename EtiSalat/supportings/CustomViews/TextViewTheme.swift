//
//  TextViewTheme.swift
//  Allot
//
//  Created by Mani Deepika J M on 4/4/23.
//

import UIKit


class TextViewTheme: UITextView {

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        updateTextviewTheme()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateTextviewTheme()
    }
    
   
    
    func updateTextviewTheme() {
        self.textColor = APPThemeColor.title
        self.linkTextAttributes = [.foregroundColor: APPThemeColor.link, .underlineStyle: 0]
        self.isSelectable = true
        self.isEditable = false
        self.isUserInteractionEnabled = true
        self.dataDetectorTypes = .link
        self.isScrollEnabled = false
    }
}
