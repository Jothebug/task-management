//
//  TaskModel.swift
//  task-management
//
//  Created by HaYen on 2/3/25.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    let id: String
    let task: String
    let isCompleted: Bool
    let isPrioritized: Bool
    
    init(id: String = UUID().uuidString, task: String, isCompleted: Bool, isPrioritized: Bool) {
        self.id = id
        self.task = task
        self.isCompleted = isCompleted
        self.isPrioritized = isPrioritized
    }
    
    func updateTaskCompletion() -> TaskModel {
        return TaskModel(id: id, task: task, isCompleted: !isCompleted, isPrioritized: isPrioritized)
    }
}
