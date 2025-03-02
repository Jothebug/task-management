//
//  TasksViewModel.swift
//  task-management
//
//  Created by HaYen on 2/3/25.
//

import Foundation

class TasksViewModel: ObservableObject {
    let tasksKey: String = "TASKS_KEY"
    
    @Published var tasks: [TaskModel] = [] {
        didSet {
            saveTasks()
        }
    }
    
    init() {
        getTasks()
    }
    
    func getTasks() {
        guard
            let data = UserDefaults.standard.data(forKey: tasksKey),
            let decodedData = try? JSONDecoder().decode([TaskModel].self, from: data)
        else { return }
        
        self.tasks = decodedData
    }
    
    func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
    
    func addTask(title: String, isPrioritized: Bool) {
        let newTask = TaskModel(task: title, isCompleted: false, isPrioritized: isPrioritized)
        
        if isPrioritized {
            tasks.insert(newTask, at: 0)
        } else {
            tasks.append(newTask)
        }
    }
    
    func updateTask(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task.updateTaskCompletion()
        }
    }
    
    func saveTasks() {
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: tasksKey)
        }
    }
}
