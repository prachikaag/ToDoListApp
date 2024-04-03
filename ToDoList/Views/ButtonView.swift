//
//  ButtonView.swift
//  ToDoList
//
//  Created by PRACHIKA AGARWAL on 24/03/24.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let backgroundcolor: Color
    let action:()->Void
    var body: some View {
        Button {
            //Action occur
            action()
        } label : {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundcolor)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding(10)
    }
}

struct ButtonView_Previews : PreviewProvider {
    static var previews: some View{
        ButtonView(title:"Test",backgroundcolor: .pink){
            //some action
        }
    }
}
