//
//  AppConstants.swift
//  NotesApp
//
//  Created by Pranav Singh on 05/03/23.
//

import UIKit
import SwiftUI

//MARK: - Enums
enum NavigationEnum: Hashable {
    case showNotesScreen, addNoteScreen, updateNoteScreen(Note)
}

enum MulishFontEnum {
    case extraLight, light, regular, medium, semiBold, bold
}

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

//MARK: Font
extension Font {
    static func mulishExtraLight(ofSize size: CGFloat) -> Font {
        return Font(UIFont.mulishLight(ofSize: size) as CTFont)
    }
    
    static func mulishLight(ofSize size: CGFloat) -> Font {
        return Font(UIFont.mulishLight(ofSize: size) as CTFont)
    }
    
    static func mulishRegular(ofSize size: CGFloat) -> Font {
        return Font(UIFont.mulishRegular(ofSize: size) as CTFont)
    }
    
    static func mulishMedium(ofSize size: CGFloat) -> Font {
        return Font(UIFont.mulishMedium(ofSize: size) as CTFont)
    }
    
    static func mulishSemiBold(ofSize size: CGFloat) -> Font {
        return Font(UIFont.mulishSemiBold(ofSize: size) as CTFont)
    }
    
    static func mulishBold(ofSize size: CGFloat) -> Font {
        return Font(UIFont.mulishBold(ofSize: size) as CTFont)
    }
    
    static func mulishFont(_ font: MulishFontEnum, ofSize size: CGFloat) -> Font {
        switch font {
        case .extraLight:
            return mulishExtraLight(ofSize: size)
        case .light:
            return mulishLight(ofSize: size)
        case .regular:
            return mulishRegular(ofSize: size)
        case .medium:
            return mulishMedium(ofSize: size)
        case .semiBold:
            return mulishSemiBold(ofSize: size)
        case .bold:
            return mulishBold(ofSize: size)
        }
    }
    
    public static let mulishLargeTitle: Font = Font(UIFont.mulishLargeTitle as CTFont)
    public static let mulishTitle: Font = Font(UIFont.mulishTitle as CTFont)
    public static let mulishTitle2: Font = Font(UIFont.mulishTitle2 as CTFont)
    public static let mulishTitle3: Font = Font(UIFont.mulishTitle3 as CTFont)
    public static let mulishHeadline: Font = Font(UIFont.mulishHeadline as CTFont)
    public static let mulishSubheadline: Font = Font(UIFont.mulishSubheadline as CTFont)
    public static let mulishBody: Font = Font(UIFont.mulishBody as CTFont)
    public static let mulishCallout: Font = Font(UIFont.mulishCallout as CTFont)
    public static let mulishFootnote: Font = Font(UIFont.mulishFootnote as CTFont)
    public static let mulishCaption: Font = Font(UIFont.mulishCaption as CTFont)
    public static let mulishCaption2: Font = Font(UIFont.mulishCaption2 as CTFont)
}

//MARK: - UIFont
extension UIFont {
    
    static func mulishExtraLight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Mulish-ExtraLight", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func mulishLight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Mulish-Light", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func mulishRegular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Mulish-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func mulishMedium(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Mulish-Medium", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func mulishSemiBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Mulish-SemiBold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func mulishBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Mulish-Bold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func mulishFont(_ font: MulishFontEnum, ofSize size: CGFloat) -> UIFont {
        switch font {
        case .extraLight:
            return mulishExtraLight(ofSize: size)
        case .light:
            return mulishLight(ofSize: size)
        case .regular:
            return mulishRegular(ofSize: size)
        case .medium:
            return mulishMedium(ofSize: size)
        case .semiBold:
            return mulishSemiBold(ofSize: size)
        case .bold:
            return mulishBold(ofSize: size)
        }
    }
    
    public static let mulishLargeTitle: UIFont = .mulishFont(.semiBold, ofSize: 35)
    public static let mulishTitle: UIFont = .mulishFont(.medium, ofSize: 28)
    public static let mulishTitle2: UIFont = .mulishFont(.medium, ofSize: 22)
    public static let mulishTitle3: UIFont = .mulishFont(.medium, ofSize: 20)
    public static let mulishHeadline: UIFont = .mulishFont(.bold, ofSize: 17)
    public static let mulishSubheadline: UIFont = .mulishFont(.medium, ofSize: 15)
    public static let mulishBody: UIFont = .mulishFont(.regular, ofSize: 17)
    public static let mulishCallout: UIFont = .mulishFont(.regular, ofSize: 15)
    public static let mulishFootnote: UIFont = .mulishFont(.regular, ofSize: 13)
    public static let mulishCaption: UIFont = .mulishFont(.regular, ofSize: 12)
    public static let mulishCaption2: UIFont = .mulishFont(.regular, ofSize: 11)
}
