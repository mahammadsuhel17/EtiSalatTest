//
//  File.swift
//  Allot
//
//  Created by Mani Deepika J M on 3/29/23.
//

import UIKit

enum TextTheme {
    case titleText
    case descriptionText
    case linkText
    case headingText
    case bodyText
    case bodyMediumText
}

class LabelTheme: UILabel {
    
    var textTheme: TextTheme? {
        didSet {
            updateLabelTheme()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        self.letterSpace = 0.2
        self.setLineSpacing(lineSpacing: 2)
        self.numberOfLines = 0
    }
    
    func updateLabelTheme() {
        switch textTheme {
        case .titleText:
            self.font = APPFont.title
            self.textColor = APPThemeColor.title
            self.textAlignment = .center
            
        case .descriptionText:
            self.font = APPFont.description
            self.textColor = APPThemeColor.title
            self.textAlignment = .center
            
        case .linkText:
            self.font = APPFont.extraSmall
            self.textColor = APPThemeColor.title
            self.isUserInteractionEnabled = true
            
        case .headingText:
            self.font = APPFont.heading
            self.textColor = .white
            self.textAlignment = .center
            
        case .bodyText:
            self.font = APPFont.body
            self.textColor = APPThemeColor.title
            
        case .bodyMediumText:
            self.font = APPFont.bodyMedium
            self.textColor = APPThemeColor.title
            
        case .none:
            print("something went wrong")
        }
    }
}
