//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by PRACHIKA AGARWAL on 24/03/24.
//

import SwiftUI
import FirebaseCore


@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
