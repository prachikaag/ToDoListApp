//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by PRACHIKA AGARWAL on 24/03/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewmodel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    private var userId: String
    
    init(userId: String){
        self.userId = userId
        // users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewmodel = StateObject(
            wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                // Delete action
                                viewmodel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    viewmodel.showingNewItemView = true
                    // action
                } label:{
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewmodel.showingNewItemView){
                NewItemView(newItemPresented: $viewmodel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Preview: PreviewProvider {
    static var previews: some View{
        ToDoListView(userId: "C99BB2B1-4AA9-4625-B436-86476E253056")
    }
}
