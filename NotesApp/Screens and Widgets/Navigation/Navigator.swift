//
//  Navigator.swift
//  NotesApp
//
//  Created by Pranav Singh on 01/01/24.
//

import Foundation

final class Navigator<T: Hashable>: ObservableObject {
    @Published var paths: [T] = []
    
    func push(_ path: T) {
        paths.append(path)
    }
    
    func pop() {
        paths.removeLast(1)
    }
}
