//
//  task_managementApp.swift
//  task-management
//
//  Created by HaYen on 1/3/25.
//

import SwiftUI

@main
struct task_managementApp: App {
    
    @StateObject var tasksViewModel: TasksViewModel = TasksViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListTasksView()
            }
            .environmentObject(tasksViewModel)
        }
    }
}
