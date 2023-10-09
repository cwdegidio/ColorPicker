//
//  TaskRow.swift
//  

import SwiftUI

struct TaskRowView: View {
    @ObservedObject var taskStore: TaskStore
    @State var taskStatus: Bool = false
    
  let task: Task
  var body: some View {
    return HStack {
      Text(task.title)
      Spacer()
      Image(systemName: taskStatus ? "checkmark.square" : "square")
        .foregroundColor(taskStatus ? Color.green : Color.red)
        .animation(.default, value: taskStatus)
        .onTapGesture {
            taskStatus.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                taskStore.toggleTaskCompletion(task: task)
            }
            
        }
        .onAppear {
            taskStatus = task.isCompleted
        }
    }
    .font(.title3)
    .bold()
    .padding([.top, .bottom], 15)
    .padding([.leading, .trailing], 10)
  }
}

struct TaskRow_Previews: PreviewProvider {
  static var previews: some View {
      TaskRowView(taskStore: TaskStore(), task: Task(title: "My Task", category: .noCategory, isCompleted: false))
  }
}
