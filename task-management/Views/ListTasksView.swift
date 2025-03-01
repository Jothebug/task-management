//
//  ListTasksView.swift
//  task-management
//
//  Created by HaYen on 1/3/25.
//

import SwiftUI

struct ListTasksView: View {
   
    @State var tasks : [TaskModel] = [
        TaskModel(task: "First task", isCompleted: false),
        TaskModel(task: "Second task", isCompleted: true),
        TaskModel(task: "Third task", isCompleted: true)
    ];
    
    var body: some View {
        List {
            ForEach(tasks) { item in
                TaskRow(item: item)
            }
          
        }
        .navigationTitle("Tasks")
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton() // Must be inside a closure
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddTask()) // Use label instead of title
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListTasksView()
    }
}
