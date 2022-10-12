//
//  WordlTravelerApp.swift
//  WordlTraveler
//
//  Created by Hicret Ay on 12.10.2022.
//

import SwiftUI

@main
struct WordlTravelerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
