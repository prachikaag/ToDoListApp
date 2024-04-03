//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by PRACHIKA AGARWAL on 24/03/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewModel: ObservableObject{
    @Published var title = ""
    @Published var duedate = Date()
    @Published var showAleart = false
    init(){
        
    }
    func save(){
        guard canSave else {
            return
        }
        // Get current userid
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        // create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: duedate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        // save model to db as a subcollection of current user
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard duedate >= Date().addingTimeInterval(-84600) else {
            //subtracting 24hrs
            return false
        }
        return true
    }
}
