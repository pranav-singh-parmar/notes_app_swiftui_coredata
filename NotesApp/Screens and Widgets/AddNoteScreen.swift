//
//  AddNoteScreen.swift
//  NotesApp
//
//  Created by Pranav Singh on 08/02/23.
//

import SwiftUI

//https://stackoverflow.com/questions/37344822/saving-image-and-then-loading-it-in-swift-ios
struct AddNoteScreen: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    
    @StateObject private var note = Note()
    
    private let isFromUpdate: Bool
    
    init(note: Note? = nil) {
        self._note = StateObject(wrappedValue: Note(context: Singleton.shared.persistanceController.viewContext))
        if let note {
            self.isFromUpdate = true
            self.note.title = note.title
            self.note.content = note.content
            self.note.image = note.image
        } else {
            self.isFromUpdate = false
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                
            }
            
            Button {
                addUpdateNote()
            } label: {
                Text(isFromUpdate ? "Update" : "Add")
            }
        }.onAppear {
            
        }
    }
    
    private func addUpdateNote() {
        Singleton.shared.persistanceController.saveViewContext()
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct AddNoteScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteScreen()
    }
}
