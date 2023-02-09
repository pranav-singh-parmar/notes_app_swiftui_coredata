//
//  AddForm.swift
//  NotesApp
//
//  Created by Pranav Singh on 08/02/23.
//

import SwiftUI

struct AddForm: View {
    var body: some View {
        Button {
            addItem()
        } label: {
            Text("Add Item")
        }
    }
    
    private func addItem() {
        let viewContext = PersistenceController.shared.container.viewContext
        
        let newItem = User(context: viewContext)
        newItem.name = "Hello"

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

struct AddForm_Previews: PreviewProvider {
    static var previews: some View {
        AddForm()
    }
}
