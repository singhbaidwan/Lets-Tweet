//
//  EagleApp.swift
//  Eagle
//
//  Created by Dalveer singh on 13/06/22.
//

import SwiftUI
import Firebase
@main
struct EagleApp: App {
    @StateObject var viewModel = AuthViewModel()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
            ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
