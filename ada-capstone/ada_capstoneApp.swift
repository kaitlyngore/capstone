//
//  ada_capstoneApp.swift
//  ada-capstone
//
//  Created by Kaitlyn Gore on 1/27/22.
//

import SwiftUI
import Firebase

@main
struct ada_capstoneApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
                   [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//    FirebaseApp.configure()

    return true
  }
}
