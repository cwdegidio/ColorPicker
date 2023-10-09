//
//  TaskListView.swift
//  

import SwiftUI

struct TaskListView: View {
  @ObservedObject var taskStore: TaskStore
    @State var showCompletedTasks: Bool
    @State private var title = ""
    
    var matchingTasks: [Task] {
        var tasks = taskStore.tasks
        
        if !title.isEmpty {
            tasks = tasks.filter {
                $0.title.lowercased().contains(title.lowercased())
            }
        }
        
        return tasks
    }
    
  var body: some View {
    NavigationStack {
      ScrollViewReader { scrollProxy in
          List {
              ForEach(matchingTasks) { task in
                  if (task.isCompleted == showCompletedTasks) {
                      NavigationLink(value: task) {
                        VStack {
                            TaskRowView(taskStore: taskStore, task: task)
                        }
                        .padding([.leading, .trailing], 20)
                      }
                  }
              }
        }
          .searchable(text: $title)
        .navigationDestination(for: Task.self) { task in
          TaskDetailView(task: $taskStore.tasks
            .first(where: { $0.id == task.id })!)
        }
      }
    }
  }
}

struct TaskListView_Previews: PreviewProvider {
  static var previews: some View {
    TaskListView(taskStore: TaskStore(), showCompletedTasks: false)
  }
}
