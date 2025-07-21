import SwiftUI

struct ContentView: View {
    // @StateObject creates a single source of truth for the view model in this view.
    // It ensures the TaskListViewModel instance is created once and stays alive.
        @StateObject private var viewModel = TaskListViewModel()
        
        var body: some View {
            VStack {
                List(viewModel.tasks) { task in
                    HStack {
                        Text(task.title)
                        Spacer()
                        Button(action: {
                            viewModel.removeTask(id: task.id)
                        }) {
                            Image(systemName: "trash")
                        }
                        .accessibilityIdentifier("Delete Task")
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                
                Button("Add Task") {
                    viewModel.addTask(title: "New Task")
                }
                .accessibilityIdentifier("Add Task")
                .padding()
            }
        }
    }
