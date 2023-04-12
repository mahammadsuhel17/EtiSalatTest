//
//  WelcomeViewModel.swift
//  Allot
//
//  Created by Mani Deepika J M on 3/29/23.
//

import Foundation


struct WelcomeViewModel {
    
    func getTitles(for title: Welcome) -> String {
        return title.text
    }
    
    func getCheckboxDimensions(for checkbox: welcomeCheckbox) -> CGFloat {
        return checkbox.dimension
    }
    
}
