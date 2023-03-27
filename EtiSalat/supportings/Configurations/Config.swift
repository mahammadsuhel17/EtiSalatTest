//
//  Config.swift
//  EtiSalat
//
//  Created by Mahammadsuel C on 3/27/23.
//

import Foundation
import UIKit

//Font Sizes
let TitleFontSize = 24
let DescriptionFontSize = 16
let ButtonFontSize = 16
let ExtraSmallFontSize = 12
let SmallTitleFontSize = 14
let AlertTitleSize = 22

//Font Names
let RegularTextFontName = "Roboto-Regular"
let MediumTextFontName = "Roboto-Medium"
let BoldTextFontName = "Roboto-Bold"

struct APPFont {
    //Font Constants
    static let title = UIFont(name: BoldTextFontName, size: CGFloat(TitleFontSize))
    static let description = UIFont(name: RegularTextFontName, size: CGFloat(DescriptionFontSize))
    static let button = UIFont(name: BoldTextFontName, size: CGFloat(ButtonFontSize))
    static let extraSmall = UIFont(name: RegularTextFontName, size: CGFloat(ExtraSmallFontSize))
    static let smallTitle = UIFont(name: MediumTextFontName, size: CGFloat(SmallTitleFontSize))
    static let alertTitle = UIFont(name: BoldTextFontName, size: CGFloat(AlertTitleSize))
    static let alertButton = UIFont(name: BoldTextFontName, size: CGFloat(SmallTitleFontSize))
}

struct APPThemeColor {
    //Font Constants
    static let title = UIColor(hexString: "#0A0A0A")
    static let description = UIColor(hexString: "#353738")
    static let disabledButtonBackground = UIColor(hexString: "#CCCCCC")
    static let buttonBackground = UIColor(hexString: "#E00800")
    static let disabledButtonTitle = UIColor(hexString: "#A4A4A4")
    static let buttonTitle = UIColor(hexString: "#ffffff")
    static let link = UIColor(hexString: "#3366CC")
    static let black = UIColor(hexString: "#000000")
    static let alertButtonBG = UIColor(hexString: "#EEEEEE")
}
