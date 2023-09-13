//
//  RoundedRectangleStyle.swift
//  NotesApp
//
//  Created by Pranav Singh on 13/09/23.
//

import SwiftUI

struct RoundedRectangleStyle<Content> : View where Content : View {
    
    private let title: String
    private let imageName: String
    private let titleSpacing: CGFloat
    private let contentVerticalPadding: CGFloat
    private let contentHorizontalPadding: CGFloat
    private let backgroundColor: Color
    private let cornerRadius: CGFloat
    private let lineWidth: CGFloat
    private let content: Content
    
    init(title: String = "",
         imageName: String = "",
         titleSpacing: CGFloat = 10,
         contentVerticalPadding: CGFloat = 10,
         contentHorizontalPadding: CGFloat = 10,
         backgroundColor: Color = .clear,
         cornerRadius: CGFloat = 5,
         lineWidth: CGFloat = 1,
         @ViewBuilder content: () -> Content) {
        self.title = title
        self.imageName = imageName
        self.titleSpacing = titleSpacing
        self.contentVerticalPadding = contentVerticalPadding
        self.contentHorizontalPadding = contentHorizontalPadding
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.lineWidth = lineWidth
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: titleSpacing) {
            if !title.isEmpty {
                Text(title)
                    .font(.body)
                    .foregroundColor(.blackColor)
            }
            
            HStack(alignment: .center) {
                if !imageName.isEmpty {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.primaryColor)
                        .frame(width: 20, height: 20)
                }
                
                content
            }.padding(.vertical, contentVerticalPadding)
                .padding(.horizontal, contentHorizontalPadding)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .stroke(Color.darkGrayColor, lineWidth: lineWidth)
                )
        }
    }
}

struct RoundedRectangleStyle_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleStyle(title: "Hello",
                              imageName: "personIconTemplate") {
            
        }
    }
}
