//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Pranav Singh on 08/02/23.
//

import SwiftUI

@main
struct NotesAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ShowUsers()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
