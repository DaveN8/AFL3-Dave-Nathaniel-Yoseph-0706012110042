//
//  AFL3_Dave_Nathaniel_Yoseph_0706012110042App.swift
//  AFL3-Dave Nathaniel Yoseph-0706012110042
//
//  Created by MacBook Pro on 24/04/23.
//

import SwiftUI

@main
struct AFL3_Dave_Nathaniel_Yoseph_0706012110042App: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        #if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}
