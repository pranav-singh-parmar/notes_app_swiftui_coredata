//
//  AddNoteScreen.swift
//  NotesApp
//
//  Created by Pranav Singh on 08/02/23.
//

import SwiftUI

struct AddNoteScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        Button {
            addItem()
        } label: {
            Text("Add Item")
        }
    }
    
    private func addItem() {
        let newItem = Note(context: viewContext)
        newItem.content = "Data"

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct AddNoteScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteScreen()
    }
}
