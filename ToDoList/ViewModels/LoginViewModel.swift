//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by PRACHIKA AGARWAL on 24/03/24.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init(){}
    
    func login(){
        guard validate() else {
            return
        }
        //Firebase authentication
        Auth.auth().signIn(withEmail: email, password: password)
        print("Called")
    }
    
    private func validate()-> Bool{
        guard email.trimmingCharacters(in: .whitespaces).isEmpty,
              password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = "Please enter all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }
        return true
    }
}
