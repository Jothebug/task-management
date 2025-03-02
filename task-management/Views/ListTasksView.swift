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
        ZStack {
            if tasksViewModel.tasks.isEmpty {
                EmptyTask()
                    .transition(AnyTransition.opacity.animation(.linear))
            } else {
                List {
                    ForEach(tasksViewModel.tasks) { item in
                        TaskRow(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    tasksViewModel.updateTask(task: item)
                                }
                            }
                    }
                    .onDelete(perform: tasksViewModel.deleteTask)
                    .onMove(perform: tasksViewModel.moveTask)
                }
            }
        }
        .navigationTitle("Tasks")
        .listStyle(.plain)
        .toolbar {
            if !tasksViewModel.tasks.isEmpty {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton() // Must be inside a closure
                }
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
