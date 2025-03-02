//
//  EmptyTask.swift
//  task-management
//
//  Created by HaYen on 2/3/25.
//

import SwiftUI

struct EmptyTask: View {
    
    @State var animate: Bool = false
    let secondaryColor = Color("SecondaryColor")
    let accentColor = Color("AccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Text("There are no tasks!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                    .font(.subheadline)
                
                NavigationLink(destination: AddTask()) {
                    Text("Add task 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 45)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(animate ? accentColor : secondaryColor)
                        .cornerRadius(10)
                }
                .padding(.top, 40)
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? accentColor.opacity(0.6): secondaryColor.opacity(0.6),
                    radius: animate ? 20 : 10,
                    x: 0,
                    y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400) //  set maxWidth 400 to prevent the UI spread when rotate screen
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: handleAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func handleAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(Animation
                .easeInOut(duration: 2.0)
                .repeatForever()) {
                    animate.toggle()
            }
        }
    }
}

#Preview {
    EmptyTask()
}
