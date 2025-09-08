//
//  CRUD1App.swift
//  CRUD1
//
//  Created by Mac on 05/09/25.
//

import SwiftUI

@main
struct CRUD1App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


