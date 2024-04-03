//
//  RegisterView.swift
//  ToDoList
//
//  Created by PRACHIKA AGARWAL on 24/03/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewmodel = RegisterViewModel()
    var body: some View {
        NavigationView{
            VStack{
                HeaderView(title: "Register", 
                           subtitle: "Start organizing To Do",
                           angle: -15,
                           backgroundcolor: .orange)
                Form{
                    TextField("Name",text:$viewmodel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    TextField("Enter your email",text:$viewmodel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    SecureField("Enter your password",text: $viewmodel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    ButtonView(title:"Create Account",
                               backgroundcolor: .pink
                    ){
                        viewmodel.register()
                        //some action
                    }
                }
                .offset(y:-50)
            }
            Spacer()
        }
    }
}

struct RegistrationView_View: PreviewProvider{
    static var previews: some View{
        RegisterView()
    }
}
