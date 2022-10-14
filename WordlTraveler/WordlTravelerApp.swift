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
                        Text("TAB_CONVERSION")
                        
                    }
                }
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                
                MapView().tabItem{
                    HStack{
                        Image(systemName: "map")
                        Text("TAB_MAP")
                    }
                }
            }.accentColor(.yellow)
            
        }
    }
}
