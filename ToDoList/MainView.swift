//
//  ContentView.swift
//  ToDoList
//
//  Created by PRACHIKA AGARWAL on 24/03/24.
//

import SwiftUI

struct MainView: View {
@StateObject var viewmodel = MainViewModel()
    var body: some View {
        if viewmodel.isSignedIn, !viewmodel.currentId.isEmpty{
            //signed in
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userId: viewmodel.currentId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView(userId: viewmodel.currentId)
                .tabItem {
                    Label("Profile", systemImage:"person.circle") }
            }
    }
}

struct MainView_previews: PreviewProvider{
    static var previews: some View{
        MainView()
    }
}
