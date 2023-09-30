//
//  TaskDetailView.swift
//  Task List
//
//  Created by Curtis DeGidio on 9/29/23.
//

import SwiftUI

struct TaskDetailView: View {
    @State var task: Task
    @ObservedObject var taskStore: TaskStore
    
    var body: some View {
        Form {
            Section("Task Title") {
                TextField("Task Title", text: $task.title)
                    .onChange(of: task.title) {
                        taskStore
                            .updateTaskTitle(title: task.title, for: task)
                    }
            }
            Section("Notes") {
                TextField("Notes", text: $task.notes, axis: .vertical)
                    .onChange(of: task.notes) {
                        taskStore
                            .updateTaskNotes(notes: task.notes, for: task)
                    }
                    .lineLimit(5...)
            }
            Section {
                Toggle("Completed:", isOn: $task.isCompleted)
                    .onChange(of: task.isCompleted) {
                        taskStore.completeTask(&task)
                    }
            }
        }
    }
}

#Preview {
    TaskDetailView(
        task: defaultData[0], taskStore: TaskStore(tasks: defaultData)
    )
}
