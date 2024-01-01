//
//  AddNoteScreen.swift
//  NotesApp
//
//  Created by Pranav Singh on 08/02/23.
//

import SwiftUI
import UIKit

//https://stackoverflow.com/questions/37344822/saving-image-and-then-loading-it-in-swift-ios
struct AddNoteScreen: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var navigator: Navigator<NavigationEnum>
    
    @State private var title: String = ""
    @State private var noteContent: String = ""
    
    private let isFromUpdate: Bool
    
    private let spacing: CGFloat = 10
    private let padding: CGFloat = 16
    
    init(note: Note? = nil) {
        //self._note = State(wrappedValue: Note(context: Singleton.shared.persistanceController.viewContext))
        if let note {
            self.isFromUpdate = true
            self.title = note.title ?? ""
            self.noteContent = note.content ?? ""
        } else {
            self.isFromUpdate = false
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                
                MyTextField("Add Title", text: $title)
                    .roundedRectangleStyle()
                
                MyTextView("Add Note", text: $noteContent)
                    .roundedRectangleStyle(contentVerticalPadding: 10,
                        contentHorizontalPadding: 6)
                
                Button {
                    addUpdateNote()
                } label: {
                    Text(isFromUpdate ? "Update" : "Add")
                        .font(.mulishBody)
                }
                
            }.padding(padding)
        }.onAppear {
            
        }
    }
    
    private func addUpdateNote() {
        let note = Note(context: viewContext)
        note.title = title
        note.content = noteContent
        Singleton.shared.persistanceController.saveViewContext()
        //self.presentationMode.wrappedValue.dismiss()
        navigator.pop()
    }
}

struct AddNoteScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteScreen()
    }
}
