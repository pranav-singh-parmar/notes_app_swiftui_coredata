//
//  Extenstions.swift
//  NotesApp
//
//  Created by Pranav Singh on 13/09/23.
//

import SwiftUI

//MARK: - Binding
extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}

//MARK: - View
extension View {
    @ViewBuilder
    func roundedRectangleStyle(title: String = "",
                               imageName: String = "",
                               contentVerticalPadding: CGFloat = 16,
                               contentHorizontalPadding: CGFloat = 10,
                               backgroundColor: Color = .clear,
                               cornerRadius: CGFloat = 5,
                               lineWidth: CGFloat = 1) -> some View {
        RoundedRectangleStyle(title: title,
                              imageName: imageName,
                              contentVerticalPadding: contentVerticalPadding,
                              contentHorizontalPadding: contentHorizontalPadding,
                              backgroundColor: backgroundColor,
                              cornerRadius: cornerRadius,
                              lineWidth: lineWidth,
                              content: {self})
    }
}
