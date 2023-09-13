//
//  AdjustableHeightTextView.swift
//  NotesApp
//
//  Created by Pranav Singh on 13/09/23.
//

import SwiftUI

struct AdjustableHeightTextView: UIViewRepresentable {

    @Binding private var height: CGFloat
    private let maxheight: CGFloat
    @Binding private var text: String
    private let uiFont: UIFont
    private let textColor: Color
    private let keyboardType: UIKeyboardType
    private let autoCapitalization: UITextAutocapitalizationType
    private let cursorColor: Color
    
    init(height: Binding<CGFloat>,
         maxheight: CGFloat,
         text: Binding<String>,
         uiFont: UIFont,
         textColor: Color,
         keyboardType: UIKeyboardType,
         autoCapitalization: UITextAutocapitalizationType,
         cursorColor: Color) {
        self._height = height
        self.maxheight = maxheight
        self._text = text
        self.uiFont = uiFont
        self.textColor = textColor
        self.keyboardType = keyboardType
        self.autoCapitalization = autoCapitalization
        self.cursorColor = cursorColor
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.text = text
        textView.textColor = UIColor(textColor)
        textView.keyboardType = keyboardType
        textView.autocapitalizationType = autoCapitalization
        textView.tintColor = UIColor(cursorColor)
        
        textView.font = uiFont
        
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
    }

    class Coordinator: NSObject, UITextViewDelegate {
        private let textView: AdjustableHeightTextView
        init(_ textView: AdjustableHeightTextView) {
            self.textView = textView
        }

        func textViewDidChange(_ textView: UITextView) {
            DispatchQueue.main.async {
                self.textView.text = textView.text
                let contentSize = textView.sizeThatFits(textView.bounds.size)
                if contentSize.height >= self.textView.maxheight {
                    textView.isScrollEnabled = true
                    self.textView.height = self.textView.maxheight
                }else{
                    textView.isScrollEnabled = false
                    self.textView.height = contentSize.height
                }
            }
        }
    }
}

//struct AdjustableHeightTextView_Previews: PreviewProvider {
//    static var previews: some View {
//        AdjustableHeightTextView(height: .constant(50), maxheight: 100)
//    }
//}
