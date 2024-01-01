//
//  NotesApp.swift
//  NotesApp
//
//  Created by Pranav Singh on 08/02/23.
//

import SwiftUI

@main
struct NotesApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @ObservedObject private var appEnvironmentObject = Singleton.shared.appEnvironmentObject
    @ObservedObject private var navigator = Navigator<NavigationEnum>()
    
    private let persistenceController = Singleton.shared.persistanceController

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appEnvironmentObject)
                .environmentObject(navigator)
                .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}
