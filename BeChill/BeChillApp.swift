//
//  BeChillApp.swift
//  BeChill
//
//  Created by Krzysztof Kubiak on 27/11/2023.
//

import SwiftUI
import SwiftData
//import FirebaseCore
//import FirebaseAuth
//import FirebaseFirestore

//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}

@main
struct BeChillApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Post.self,
            User.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    

    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
        .modelContainer(sharedModelContainer)
    }
}
