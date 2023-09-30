//
//  ContentView.swift
//  Task List
//
//  Created by Curtis DeGidio on 9/28/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var taskStore = TaskStore(tasks: defaultData)
    @State private var showTaskDetails = false
    @State private var showNewTaskSheet = false
    
    var body: some View {
        NavigationStack {
            TaskListView(taskStore: taskStore)
            Spacer()
            NewTaskButton(showSheet: $showNewTaskSheet)
        }
        .sheet(isPresented: $showNewTaskSheet, content: {
            NewTaskView(taskStore: taskStore)
        })
    }
}

#Preview {
    ContentView()
}
