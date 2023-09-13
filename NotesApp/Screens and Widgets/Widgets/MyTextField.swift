//
//  MyTextField.swift
//  NotesApp
//
//  Created by Pranav Singh on 13/09/23.
//

import SwiftUI
import Combine

struct MyTextField: View {
    
    //MARK: - Variables
    private let placeHolder: String
    @Binding private var text: String
    private let font: Font
    private let textColor: Color
    private let cursorColor: Color
    private let keyboardType: UIKeyboardType
    private let autoCapitalization: UITextAutocapitalizationType
    private let maxLength: Int?
    private let fixedSize: Bool
    private let onEditingChanged: (Bool) -> Void
    //let onCommit:
    
    //MARK: - init
    init(_ placeHolder: String,
         text: Binding<String>,
         font: Font = .callout,
         textColor: Color = .blackColor,
         cursorColor: Color = .primaryColor,
         keyboardType: UIKeyboardType = UIKeyboardType.default,
         autoCapitalization: UITextAutocapitalizationType = UITextAutocapitalizationType.none,
         maxLength: Int? = nil,
         fixedSize: Bool = false,
         onEditingChanged: @escaping (Bool) -> Void = { _ in
    }
//         onCommit: {
//            // Called when the user tap the return button
//            // see `onCommit` oncha TextField initializer.
//            UIApplication.shared.endEditing()
//        }
    ) {
        self.placeHolder = placeHolder
        self._text = text
        self.font = font
        self.textColor = textColor
        self.cursorColor = cursorColor
        self.keyboardType = keyboardType
        self.autoCapitalization = autoCapitalization
        if maxLength != nil {
            self.maxLength = maxLength
        } else if keyboardType == .phonePad {
            self.maxLength = 10
        } else {
            self.maxLength = nil
        }
        self.fixedSize = fixedSize
        self.onEditingChanged = onEditingChanged
    }
    
    //MARK: - Views
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
            }
            
            textField
        }.onReceive(Just(text)) { newValue in
            onReceive(newValue: newValue)
        }
    }
    
    private var textField: some View {
        TextField("", text: $text, onEditingChanged: onEditingChanged)
//            .placeholder(when: text.isEmpty) {
//                placeholder
//            }
            .keyboardType(keyboardType)
            .autocapitalization(autoCapitalization)
            .font(font)
            .foregroundColor(textColor)
            .accentColor(cursorColor)
            .multilineTextAlignment(.leading)
    }
    
    private var placeholder: some View {
        Text(placeHolder)
            .foregroundColor(.placeholderColor)
            .font(font)
            .multilineTextAlignment(.leading)
    }
    
    //MARK: - Functions
    private func onReceive(newValue: String) {
        switch keyboardType {
        case .numberPad, .phonePad:
            updateValue(withFilteringString: "0123456789", andNewValue: newValue)
        case .decimalPad:
            let occurrenciesOfDot = newValue.filter { $0 == "." }.count
            updateValue(withFilteringString: "0123456789.", andNewValue: occurrenciesOfDot > 1 ? String(newValue.dropLast()) : newValue)
        default:
            updateValue(withFilteringString: newValue, andNewValue: newValue)
            break
        }
    }
    
    private func updateValue(withFilteringString filterString: String, andNewValue newValue: String) {
        let filtered = filterString.isEmpty ? newValue.filter { "0123456789.".contains($0) } : newValue
        
        if let maxLength {
            if filtered.count <= maxLength {
                if filtered != newValue {
                    text = filtered
                }
            }else{
                text = "\(text.prefix(maxLength))"
            }
        } else {
            if filtered != newValue {
                text = filtered
            }
        }
    }
}

//MARK: - Previews
struct MyTextField_Previews: PreviewProvider {
    static var previews: some View {
        MyTextField("Enter Text", text: .constant(""))
    }
}
