//
//  TasksViewModel.swift
//  task-management
//
//  Created by HaYen on 2/3/25.
//

import Foundation

class TasksViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = []
    
    init() {
        getTasks()
    }
    
    func getTasks() {
        let newTasks = [
            TaskModel(task: "First task", isCompleted: false),
            TaskModel(task: "Second task", isCompleted: true),
            TaskModel(task: "Third task", isCompleted: true)
        ];
        
        tasks.append(contentsOf: newTasks)
    }
    
    func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
    
    func addTask(title: String) {
        let newTask = TaskModel(task: title, isCompleted: false)
        tasks.append(newTask)
    }
}
