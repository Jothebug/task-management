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
    @State var isChecked: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                    TextField("Type task here...", text: $textFieldText )
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                    
                    Toggle(isOn: $isChecked) {
                        Text("Is the task a priority?")
                            .font(.title3)
                    }
                    .toggleStyle(CheckboxToggleStyle())
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
            tasksViewModel.addTask(title: textFieldText, isPrioritized: isChecked)
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

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundColor(configuration.isOn ? .blue : Color(.systemGray))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    NavigationStack {
        AddTask()
    }
    .environmentObject(TasksViewModel())
}
