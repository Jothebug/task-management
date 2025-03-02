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
            TaskModel(task: "First task", isCompleted: false, isPrioritized: true),
            TaskModel(task: "Second task", isCompleted: true, isPrioritized: false),
            TaskModel(task: "Third task", isCompleted: true, isPrioritized: false)
        ];
        tasks.append(contentsOf: newTasks)
    }
    
    func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
    
    func addTask(title: String, isPrioritized: Bool) {
        let newTask = TaskModel(task: title, isCompleted: false, isPrioritized: isPrioritized)
        tasks.append(newTask)
    }
    
    func updateTask(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task.updateTaskCompletion()
        }
    }
}
