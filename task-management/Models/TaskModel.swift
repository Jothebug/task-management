//
//  TaskModel.swift
//  task-management
//
//  Created by HaYen on 2/3/25.
//

import Foundation

struct TaskModel: Identifiable {
    let id: String = UUID().uuidString
    let task: String
    let isCompleted: Bool
}
