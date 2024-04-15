//
//  Navigator.swift
//  NotesApp
//
//  Created by Pranav Singh on 01/01/24.
//

import Foundation

final class Navigator: ObservableObject {
    @Published var paths: [NavigationEnum] = []
    
    func push(_ path: NavigationEnum) {
        paths.append(path)
    }
    
    func pop() {
        paths.removeLast(1)
    }
}
