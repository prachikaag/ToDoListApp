//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by PRACHIKA AGARWAL on 24/03/24.
//

import Foundation
import FirebaseFirestore

// View Model for List of items View primary tab
class ToDoListViewModel: ObservableObject{
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
