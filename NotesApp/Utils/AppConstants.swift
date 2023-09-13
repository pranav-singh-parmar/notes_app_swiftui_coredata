//
//  AppConstants.swift
//  NotesApp
//
//  Created by Pranav Singh on 05/03/23.
//

import UIKit
import SwiftUI

//MARK: - App Colors
//MARK: - UIColor
extension UIColor {
    //common
    static let blackColor = UIColor(named: "blackColor") ?? UIColor.clear
    static let blackColorForAllModes = UIColor(named: "blackColorForAllModes") ?? UIColor.clear
    
    static let darkGrayColor = UIColor(named: "darkGrayColor") ?? UIColor.clear
    static let defaultLightGray = UIColor(named: "defaultLightGray") ?? UIColor.clear
    static let lightGrayColor = UIColor(named: "lightGrayColor") ?? UIColor.clear
    static let placeholderColor = UIColor(named: "placeholderColor") ?? UIColor.clear
    
    static let whiteColor = UIColor(named: "whiteColor") ?? UIColor.clear
    static let whiteColorForAllModes = UIColor(named: "whiteColorForAllModes") ?? UIColor.clear
    
    //app colors
    static let primaryColor = UIColor(named: "primaryColor") ?? UIColor.clear
}

//MARK: - Color
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {
    //common
    static let blackColor = Color(.blackColor)
    static let blackColorForAllModes = Color(.blackColorForAllModes)
    
    static let darkGrayColor = Color(.darkGrayColor)
    static let defaultLightGray = Color(.defaultLightGray)
    static let lightGrayColor = Color(.lightGrayColor)
    static let placeholderColor = Color(.placeholderColor)
    
    static let whiteColor = Color(.whiteColor)
    static let whiteColorForAllModes = Color(.whiteColorForAllModes)
    
    //app colors
    static let primaryColor = Color(.primaryColor)
}

//MARK: - Enums
enum NavigationEnum: Int {
    case showNotesScreen, addNoteScreen
}
