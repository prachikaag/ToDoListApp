//
//  LoginView.swift
//  ToDoList
//
//  Created by PRACHIKA AGARWAL on 24/03/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "To Do List", 
                           subtitle: "Get Things Done!!",
                           angle: 15,
                           backgroundcolor: .pink)
                
                //Login form
                Form {
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .bold()
                    }
                    TextField("Enter your email address",text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    SecureField("Password",text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    ButtonView(title:"Login",
                               backgroundcolor: .blue
                    ){
                        viewModel.login()
                        //some action
                    }
                }
                //Create account if new
                VStack{
                    Text("New around here?")
                    NavigationLink("Create a new Account", destination: RegisterView())
                }
                .padding(.bottom,50)
                Spacer()
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider{
    static var previews: some View{
        LoginView()
    }
}
