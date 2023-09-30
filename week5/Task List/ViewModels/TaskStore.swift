//
//  TaskStore.swift
//  Task List
//
//  Created by Curtis DeGidio on 9/28/23.
//

import Foundation

class TaskStore: ObservableObject {
    @Published var tasks: [Task]
    
    init(tasks: [Task]) {
        self.tasks = tasks
    }
    
    func addTask(title: String, notes: String?) {
        let task = Task(
            id: UUID(),
            title: title,
            notes: notes ?? "",
            isCompleted: false
        )
        tasks.append(task)
    }
    
    func updateTaskTitle(title: String, for task: Task) {
        let taskIndex = getTaskIndex(task)
        if let i = taskIndex {
            tasks[i].title = title
        }
    }
    
    func updateTaskNotes(notes: String, for task: Task) {
        let taskIndex = getTaskIndex(task)
        if let i = taskIndex {
            tasks[i].notes = notes
        }
    }
    
    func completeTask(_ task: inout Task) {
        let taskIndex = getTaskIndex(task)
        if let i = taskIndex {
            tasks[i].isCompleted.toggle()
        }
    }
    
    func getTaskIndex(_ task: Task) -> Int? {
        tasks.firstIndex { t in
            t.id == task.id
        }
    }
}
