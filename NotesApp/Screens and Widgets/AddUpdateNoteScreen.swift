//
//  AddNoteScreen.swift
//  NotesApp
//
//  Created by Pranav Singh on 08/02/23.
//

import SwiftUI
import UIKit

//https://stackoverflow.com/questions/37344822/saving-image-and-then-loading-it-in-swift-ios
struct AddUpdateNoteScreen: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var navigator: Navigator
    
    @State private var title: String
    @State private var noteContent: String
    
    private let isFromUpdate: Bool
    
    private let spacing: CGFloat = 10
    private let padding: CGFloat = 16
    
    private let noteFromPreviousScreen: Note?
    
    init(note: Note? = nil) {
        //self._note = State(wrappedValue: Note(context: Singleton.shared.persistanceController.viewContext))
        noteFromPreviousScreen = note
        if let noteFromPreviousScreen {
            self.isFromUpdate = true
            self.title = noteFromPreviousScreen.title ?? ""
            self.noteContent = noteFromPreviousScreen.content ?? ""
        } else {
            self.isFromUpdate = false
            self.title = ""
            self.noteContent = ""
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                
                MyTextField(AppTexts.addTitle, text: $title)
                    .roundedRectangleStyle()
                
                MyTextView(AppTexts.addTitle, text: $noteContent)
                    .roundedRectangleStyle(contentVerticalPadding: 10,
                        contentHorizontalPadding: 6)
                
                Button {
                    addUpdateNote()
                } label: {
                    Text(isFromUpdate ? AppTexts.update : AppTexts.add)
                        .font(.mulishBody)
                }
                
            }.padding(padding)
        }
    }
    
    private func addUpdateNote() {
        if isFromUpdate {
            noteFromPreviousScreen?.title = title
            noteFromPreviousScreen?.content = noteContent
            Singleton.shared.persistanceController.saveViewContext()
        } else {
            let note = Note(context: viewContext)
            note.title = title
            note.content = noteContent
            Singleton.shared.persistanceController.saveViewContext()
        }
        //self.presentationMode.wrappedValue.dismiss()
        navigator.pop()
    }
}

struct AddUpdateNoteScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddUpdateNoteScreen()
    }
}
