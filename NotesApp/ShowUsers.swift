//
//  ShowUsers.swift
//  NotesApp
//
//  Created by Pranav Singh on 08/02/23.
//

import SwiftUI
import CoreData

struct ShowUsers: View {
    @State private var users: [User] = []
    
    var body: some View {
        List {
            ForEach(users) { user in
                Text(user.name ?? "")
            }
        }.onAppear {
            showUsers()
        }
    }
    
    private func showUsers() {
        
        let viewContext = PersistenceController.shared.container.viewContext
        
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: String(describing: User.self))

        do {
            let result = try viewContext.fetch(fetchRequest)
            users  = result as! [User]
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct ShowUsers_Previews: PreviewProvider {
    static var previews: some View {
        ShowUsers()
    }
}
