//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Pranav Singh on 08/02/23.
//

import SwiftUI

@main
struct NotesAppApp: App {
    @ObservedObject private var appEnvironmentObject = Singleton.shared.appEnvironmentObject
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appEnvironmentObject)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

enum NavigationEnum: Int {
    case ShowNotesScreen, AddNoteScreen
}
