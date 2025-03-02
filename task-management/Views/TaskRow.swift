//
//  TaskRow.swift
//  task-management
//
//  Created by HaYen on 1/3/25.
//

import SwiftUI

struct TaskRow: View {
    
    let item: TaskModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
               .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.task)
            Spacer()
            Text("|")
                .foregroundColor(item.isPrioritized ? .red : .gray)
        }
        .font(.title2)
        .padding(.vertical, 6)
    }
}

#Preview {
    TaskRow(item: TaskModel(task: "First task", isCompleted: false, isPrioritized: false))
}
