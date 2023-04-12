//
//  TextFieldTheme.swift
//  Allot
//
//  Created by Mani Deepika J M on 4/4/23.
//

import UIKit


class TextFieldTheme: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        updateTextfieldTheme()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateTextfieldTheme() {
        self.textColor = APPThemeColor.description
        self.font = APPFont.description
    }
    
    // ru, en, ....
    var languageCode:String?{
        didSet{
            if self.isFirstResponder{
                self.resignFirstResponder();
                self.becomeFirstResponder();
            }
        }
    }
    
    override var textInputMode: UITextInputMode?{
        if let language_code = self.languageCode{
            for keyboard in UITextInputMode.activeInputModes{
                if let language = keyboard.primaryLanguage{
                    let locale = Locale.init(identifier: language);
                    if locale.language.languageCode?.identifier == language_code{
                        return keyboard;
                    }
                }
            }
        }
        return super.textInputMode;
    }
    
}

