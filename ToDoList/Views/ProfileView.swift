//
//  ProfileView.swift
//  ToDoList
//
//  Created by PRACHIKA AGARWAL on 24/03/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewmodel = ProfileViewModel()
    private var userId : String
    
    init(userId:String){
        self.userId = userId
    }
    
    var body: some View {
        NavigationView{
            VStack{
                //Image
                if let user = viewmodel.user{
                    profile(user:user)
                } else {
                    Text("Loading Profile....")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewmodel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user:User) -> some View{
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .frame(width: 125, height: 125)
            .padding(20)
        //Info
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack{
                Text("email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack{
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding(20)
        //Signout
        Button("Logout"){
            viewmodel.logout()
        }
        .tint(.red)
        Spacer()
    }
}

#Preview {
    ProfileView(userId: "")
}
