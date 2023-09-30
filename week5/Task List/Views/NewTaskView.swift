//
//  NewTaskView.swift
//  Task List
//
//  Created by Curtis DeGidio on 9/30/23.
//

import SwiftUI

struct NewTaskView: View {
    @ObservedObject var taskStore: TaskStore
    @State var title: String = ""
    @State var notes: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Task Title") {
                    TextField("Task Title", text: $title)
                }
                Section("Notes") {
                    TextField("Notes", text: $notes, axis: .vertical)
                        .lineLimit(5...)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }, label: {
                        Text("Cancel")
                    })
                }
                ToolbarItem(placement: .principal) {
                    Text("Adding New Task")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        taskStore.addTask(title: title, notes: notes)
                        dismiss()
                    }, label: {
                        Text("Add")
                    })
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}

#Preview {
    NewTaskView(taskStore: TaskStore(tasks: defaultData))
}
