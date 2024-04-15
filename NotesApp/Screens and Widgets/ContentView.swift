//
//  ContentView.swift
//  NotesApp
//
//  Created by Pranav Singh on 08/02/23.
//

//https://blog.canopas.com/swiftui-exploring-navigationstack-and-making-it-useful-80092035fe1c
//https://blog.canopas.com/fixing-swiftui-navigation-with-uikit-1110df63ca0e
//https://www.swiftyplace.com/blog/better-navigation-in-swiftui-with-navigation-stack

import SwiftUI
import CoreData

struct ContentView: View {

    @EnvironmentObject var navigator: Navigator
    
    var body: some View {
        NavigationStack(path: $navigator.paths) {
            ShowNotesScreen()
                .navigationDestination(for: NavigationEnum.self) { navigation in
                    switch navigation {
                    case .showNotesScreen: ShowNotesScreen()
                    case .addNoteScreen: AddUpdateNoteScreen()
                    case .updateNoteScreen(let note): AddUpdateNoteScreen(note: note)
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
