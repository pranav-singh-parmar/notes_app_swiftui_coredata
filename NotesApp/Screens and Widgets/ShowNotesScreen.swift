//
//  ShowNotesScreen.swift
//  NotesApp
//
//  Created by Pranav Singh on 08/02/23.
//

import SwiftUI
import CoreData

struct ShowNotesScreen: View {
    @EnvironmentObject var navigator: Navigator<NavigationEnum>
    
    @State private var notes: [Note] = []
    
    var body: some View {
        ZStack {
            if notes.isEmpty {
                Text(AppTexts.noNoteAddedYet)
                    .font(.mulishBody)
            } else {
                List {
                    ForEach(notes) { note in
                        Text(note.content ?? "")
                            .font(.mulishBody)
                    }
                }
            }
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem {
                Button {
                    navigator.push(.addNoteScreen)
                } label: {
                    Label(AppTexts.newNote, systemImage: "plus")
                }
            }
        }.onAppear {
            fetchNotes()
        }
    }
    
    private func fetchNotes() {
        notes = PersistenceController.shared.fetchEntity(Note.self)
    }
}

struct ShowNotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShowNotesScreen()
    }
}
