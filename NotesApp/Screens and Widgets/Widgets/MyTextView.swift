//
//  MyTextView.swift
//  NotesApp
//
//  Created by Pranav Singh on 13/09/23.
//

import SwiftUI
import Combine

struct MyTextView: View {
    
    private let placeHolder: String
    @Binding private var text: String
    private let isAdjustableTV: Bool
    @Binding private var adjustableTVHeight: CGFloat
    private let adjustableTVMaxHeight: CGFloat
    private let uiFont: UIFont
    private let textColor: Color
    private let maxLength: Int?
    private let keyboardType: UIKeyboardType
    private let autoCapitalization: UITextAutocapitalizationType
    private let accentColor: Color
    //let onCommit:
    
    init(_ placeHolder: String,
         text: Binding<String>,
         isAdjustableTV: Bool = false,
         adjustableTVHeight: Binding<CGFloat> = .constant(40),
         adjustableTVMaxHeight: CGFloat = 100,
         uiFont: UIFont = .mulishCallout,
         textColor: Color = .blackColorForAllModes,
         maxLength: Int? = nil,
         keyboardType: UIKeyboardType = UIKeyboardType.default,
         autoCapitalization: UITextAutocapitalizationType = UITextAutocapitalizationType.sentences,
         accentColor: Color = .primaryColor
    ) {
        self.placeHolder = placeHolder
        self._text = text
        self.isAdjustableTV = isAdjustableTV
        self._adjustableTVHeight = adjustableTVHeight
        self.adjustableTVMaxHeight = adjustableTVMaxHeight
        self.uiFont = uiFont
        self.textColor = textColor
        self.maxLength = maxLength
        self.keyboardType = keyboardType
        self.autoCapitalization = autoCapitalization
        self.accentColor = accentColor
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {

            let showPlaceholder = text.isEmpty
            if showPlaceholder {
                Text(placeHolder)
                    .font(Font(uiFont))
                    .foregroundColor(.placeholderColor)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 8)
            }
            
            Group {
                if isAdjustableTV {
                    AdjustableHeightTextView(height: $adjustableTVHeight,
                                             maxheight: adjustableTVMaxHeight,
                                             text: $text,
                                             uiFont: uiFont,
                                             textColor: textColor,
                                             keyboardType: keyboardType,
                                             autoCapitalization: autoCapitalization,
                                             cursorColor: accentColor)
                    .frame(height: adjustableTVHeight)
                } else {
                    TextEditor(text: $text)
                        .transparentScrolling()
                        .font(Font(uiFont))
                        .foregroundColor(textColor)
                        .accentColor(.primaryColor)
                        .multilineTextAlignment(.leading)
                        .frame(minHeight: 150, maxHeight: 150)
//                        .colorMultiply(.clear)
//                        .background(Color.lightGrayColor)
                        .cornerRadius(5)
                }
            }//.opacity(showPlaceholder ? 0.01 : 1)
        }.onReceive(Just(text)) { newValue in
            onReceive(newValue: newValue)
        }
    }
    
    private func onReceive(newValue: String) {
        if let maxLength {
            text = "\(text.prefix(maxLength))"
        }
    }
    
    var isIOS15Aviable: Bool {
        if #available(iOS 15, *) {
            return true
        }
        return false
    }
}

struct MyTextView_Previews: PreviewProvider {
    static var previews: some View {
        MyTextView("Placeholder", text: .constant(""))
    }
}

