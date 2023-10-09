//
//  ContentView.swift
//

import SwiftUI

struct ContentView: View {
    @StateObject var taskStore = TaskStore()
    @State private var title = "test"
    
    var body: some View {
        TabView {
            NavigationStack {
                VStack {
                    if taskStore.tasks.isEmpty {
                        Text("No tasks found")
                    } else {
                        TaskListView(taskStore: taskStore, showCompletedTasks: false)
                    }
                    Spacer()
                    //NewTaskButton(addingTask: $addingTask)
                }
                .navigationTitle("My Tasks")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NewTaskButtonView(taskStore: taskStore)
                    }
                }
            }
            .tabItem {
                Label("Task", systemImage: "list.bullet.circle")
            }
            .badge(taskStore.tasks.filter { task in
                task.isCompleted == false
            }.count)
            NavigationStack {
                VStack {
                    if taskStore.tasks.isEmpty {
                        Text("No tasks found")
                    } else {
                        TaskListView(taskStore: taskStore, showCompletedTasks: true)
                    }
                    Spacer()
                    //NewTaskButton(addingTask: $addingTask)
                }
                .searchable(text: $title)
                .navigationTitle("My Tasks")
            }
            .tabItem {
                Label("Completed", systemImage: "checkmark.circle")
            }
            .badge(taskStore.tasks.filter { task in
                task.isCompleted == true
            }.count)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
