//
//  HeaderView.swift
//  ToDoList
//
//  Created by PRACHIKA AGARWAL on 24/03/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let backgroundcolor: Color
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(backgroundcolor)
                    .rotationEffect(Angle(degrees: angle))
                VStack{
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .bold()
                    Text(subtitle)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .padding(.top,60)
            }
            .frame(width:UIScreen.main.bounds.width*3,height: 300)
            .offset(y:-120)
        }
    }
}

#Preview {
    HeaderView(title: "Title", 
               subtitle: "Subtitle",
               angle: 15,
               backgroundcolor: .blue)
}
