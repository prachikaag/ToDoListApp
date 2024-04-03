//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by PRACHIKA AGARWAL on 24/03/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

// View Model for a single do to list item view for each row in item list
class ToDoListItemViewModel: ObservableObject{
    init(){}
    
    func toggleIsDone(item: ToDoListItem){
        var newItem = item // if you did this on item it would throw an error as its immutable
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
