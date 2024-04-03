//
//  NewItemView.swift
//  ToDoList
//
//  Created by PRACHIKA AGARWAL on 24/03/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewmodel = NewItemViewModel()
    @Binding var newItemPresented:Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top,100)
            Form{
                // Title
                TextField("Enter Title",text: $viewmodel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Due date
                DatePicker("Due Date",selection: $viewmodel.duedate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                // Button
                ButtonView(title: "Save",
                           backgroundcolor: .pink
                ){
                    if viewmodel.canSave{
                        viewmodel.save()
                        newItemPresented = false
                    } else {
                        viewmodel.showAleart = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewmodel.showAleart){
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields and select due date today oe newer")
                )
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View{
        NewItemView(newItemPresented: Binding(get:{
            return true
        }, set:{ _ in
        }))
    }
}
