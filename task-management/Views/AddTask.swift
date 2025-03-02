//
//  AddTask.swift
//  task-management
//
//  Created by HaYen on 1/3/25.
//

import SwiftUI

struct AddTask: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var tasksViewModel: TasksViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type task here...", text: $textFieldText )
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                
                Button(action: saveBtnPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add task")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveBtnPressed() {
        if textIsAppropriate() {
            tasksViewModel.addTask(title: textFieldText)
            presentationMode.wrappedValue.dismiss() // auto goback into the previous screen
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "⚠️ The task must be at least 3 characters long."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationStack {
        AddTask()
    }
    .environmentObject(TasksViewModel())
}
