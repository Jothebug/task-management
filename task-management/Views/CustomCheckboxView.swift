//
//  CustomCheckboxView.swift
//  task-management
//
//  Created by HaYen on 2/3/25.
//

import SwiftUI

struct CustomCheckboxView: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 22, height: 22)
                .foregroundColor(configuration.isOn ? .orange : .gray)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
            Spacer()
        }
    }
}

