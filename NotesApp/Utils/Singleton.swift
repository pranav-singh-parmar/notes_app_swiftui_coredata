//
//  Singleton.swift
//  NotesApp
//
//  Created by Pranav Singh on 09/02/23.
//

import Foundation

class Singleton {
    //Initializer access level change, now singleton class cannot be initialized again
    private init() {}
    
    static let shared = Singleton()
    
    let appEnvironmentObject = AppEnvironmentObject()
    
    let persistanceController = PersistenceController.shared
}
