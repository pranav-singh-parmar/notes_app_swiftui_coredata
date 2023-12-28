//
//  ContentView.swift
//  NotesApp
//
//  Created by Pranav Singh on 08/02/23.
//

//https://blog.canopas.com/swiftui-exploring-navigationstack-and-making-it-useful-80092035fe1c

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @EnvironmentObject private var appEnvironmentObject: AppEnvironmentObject

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Note.content, ascending: true)],
        animation: .default)
    private var notes: FetchedResults<Note>
    
//    @State private var path = Singleton.shared.appEnvironmentObject.navigationStackPath
    @State private var path: [NavigationEnum] = []
    @StateObject var loading = Singleton.shared.appEnvironmentObject

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(notes) { note in
                    NavigationLink {
                        //Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                        Text(note.content ?? "")
                            .font(.mulishBody)
                    } label: {
                        //Text(item.timestamp!, formatter: itemFormatter)
                        Text(note.content ?? "")
                            .font(.mulishBody)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
//                        Singleton.shared.appEnvironmentObject.navigationStackPath.append(NavigationEnum.AddNoteScreen)
//                        appEnvironmentObject.navigationStackPath.append(NavigationEnum.AddNoteScreen)
                        //print(appEnvironmentObject.navigationStackPath)
                        path.append(.addNoteScreen)
                        print(appEnvironmentObject.navigationStackPath)
                        print(path)
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .navigationDestination(for: NavigationEnum.self) { navigationEnum in
                if navigationEnum == .addNoteScreen {
                    AddNoteScreen()
                }
            }
        }
//        .onReceive(appEnvironmentObject.navigationStackPath, perform: { _ in
//            print("inside update")
//        })
//        .onC`hange(of: $appEnvironmentObject.navigationStackPath) { _ in
//            print("inside update")
//        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { notes[$0] }.forEach(viewContext.delete)

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
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//    .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
