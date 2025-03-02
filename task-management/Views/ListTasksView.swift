//
//  ListTasksView.swift
//  task-management
//
//  Created by HaYen on 1/3/25.
//

import SwiftUI

struct ListTasksView: View {
    
    @EnvironmentObject var tasksViewModel: TasksViewModel
    
    var body: some View {
        List {
            ForEach(tasksViewModel.tasks) { item in
                TaskRow(item: item)
            }
            .onDelete(perform: tasksViewModel.deleteTask)
            .onMove(perform: tasksViewModel.moveTask)
        }
        .navigationTitle("Tasks")
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton() // Must be inside a closure
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddTask())
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListTasksView()
    }
    .environmentObject(TasksViewModel())
}
