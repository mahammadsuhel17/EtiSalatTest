//
//  Config.swift
//  Allot
//
//  Created by Mani Deepika J M on 3/16/23.
//

import Foundation
import UIKit

//Font Sizes
let ExtraSmallFontSize = 12
let SmallTitleFontSize = 14
let TitleFontSize = 16
let LargeTitleSize = 22
let XLargeTitleFontSize = 24
let headingFontSize = 20

//Font Names
let RegularTextFontName = "Roboto-Regular"
let MediumTextFontName = "Roboto-Medium"
let BoldTextFontName = "Roboto-Bold"

struct APPFont {
    //Font Constants
    static let title = UIFont(name: BoldTextFontName, size: CGFloat(XLargeTitleFontSize))
    static let description = UIFont(name: RegularTextFontName, size: CGFloat(TitleFontSize))
    static let button = UIFont(name: BoldTextFontName, size: CGFloat(TitleFontSize))
    static let extraSmall = UIFont(name: RegularTextFontName, size: CGFloat(ExtraSmallFontSize))
    static let smallTitle = UIFont(name: MediumTextFontName, size: CGFloat(SmallTitleFontSize))
    static let alertTitle = UIFont(name: BoldTextFontName, size: CGFloat(LargeTitleSize))
    static let alertButton = UIFont(name: BoldTextFontName, size: CGFloat(SmallTitleFontSize))
    static let heading = UIFont(name: MediumTextFontName, size: CGFloat(headingFontSize))
    static let body = UIFont(name: RegularTextFontName, size: CGFloat(SmallTitleFontSize))
    static let bodyMedium = UIFont(name: MediumTextFontName, size: CGFloat(SmallTitleFontSize))
}


struct APPThemeColor {
    //Font Constants
    static let primaryColor = UIColor(hexString: "#E00800")
    static let title = UIColor(hexString: "#0A0A0A")
    static let description = UIColor(hexString: "#353738")
    static let disabledButtonBackground = UIColor(hexString: "#CCCCCC")
    static let buttonBackground = UIColor(hexString: "#E00800")
    static let disabledButtonTitle = UIColor(hexString: "#A4A4A4")
    static let buttonTitle = UIColor(hexString: "#ffffff")
    static let link = UIColor(hexString: "#3366CC")
    static let black = UIColor(hexString: "#000000")
    static let alertButtonBG = UIColor(hexString: "#EEEEEE")
    static let trasparentBackground = UIColor(hexString: "#000000CC")
}
