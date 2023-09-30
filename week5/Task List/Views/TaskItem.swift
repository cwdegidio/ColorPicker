//
//  TaskItem.swift
//  Task List
//
//  Created by Curtis DeGidio on 9/29/23.
//

import SwiftUI

struct TaskItem: View {
    var task: Task
    let taskCompleted = TaskStatus(icon: "checkmark.square", color: .green)
    let taskNotCompleted = TaskStatus(icon: "square", color: .red)
    
    var body: some View {
        HStack {
            Text(task.title)
                .fontWeight(.bold)
            Spacer()
            Image(
                systemName: task.isCompleted ? 
                    taskCompleted.icon : taskNotCompleted.icon
            )
            .foregroundStyle(task.isCompleted ?
                    taskCompleted.color : taskNotCompleted.color)
            .fontWeight(.bold)
        }
        .padding()
    }
}

struct TaskStatus {
    let icon: String
    let color: Color
}

#Preview("Task Item - Not Completed") {
    TaskItem(task: 
                Task(
                    id: UUID(),
                    title: "My Task Item",
                    notes: "Task Item Note",
                    isCompleted: false
                )
    )
}

#Preview("Task Item - Completed") {
    TaskItem(task: 
                Task(
                    id: UUID(),
                    title: "My Task Item",
                    notes: "Task Item Note",
                    isCompleted: true
                )
    )
}
