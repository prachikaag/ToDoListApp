//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by PRACHIKA AGARWAL on 24/03/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterViewModel: ObservableObject{
    @Published var email=""
    @Published var name = ""
    @Published var password = ""
    
    init(){}
    
    func register(){
        guard validate() else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insuretUserRecord(id: userId)
        }
    }
    
    private func insuretUserRecord(id: String){
        let newUser = User(id: id, 
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 4 else {
            return false
        }
        return true
    }
}
