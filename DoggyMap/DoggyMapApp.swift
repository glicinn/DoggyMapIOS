//
//  DoggyMapApp.swift
//  DoggyMap
//
//  Created by Дмитрiй Дѣренъ on 31.03.2023.
//

import SwiftUI
import FirebaseCore

@main
struct DoggyMapApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        
        WindowGroup {
//            ContentView()
            LocalNotificationController()
//WeatherContentView()
        }
    }
}
