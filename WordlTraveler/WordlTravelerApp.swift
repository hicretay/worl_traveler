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
            TabView{
                ContentView().tabItem{
                    HStack{
                        Image(systemName: "thermometer")
                        Text("Conversion")
                        
                    }
                }
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                
                MapView().tabItem{
                    HStack{
                        Image(systemName: "map")
                        Text("Map")
                    }
                }
            }.accentColor(.yellow)
            
        }
    }
}
