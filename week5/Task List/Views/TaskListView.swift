//
//  TaskListView.swift
//  Task List
//
//  Created by Curtis DeGidio on 9/30/23.
//

import SwiftUI

struct TaskListView: View {
    @StateObject var taskStore: TaskStore
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(taskStore.tasks) { task in
                    NavigationLink(value: task) {
                        TaskItem(task: task)
                    }
                    Divider()
                }
                .navigationTitle("My Tasks")
                .navigationDestination(for: Task.self) { task in
                    TaskDetailView(task: task, taskStore: taskStore)
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        TaskListView(taskStore: TaskStore(tasks: defaultData))
    }
}
