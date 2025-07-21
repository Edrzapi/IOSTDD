import SwiftUI

struct TaskListView: View {
    // @StateObject creates a single source of truth for the view model in this view.
    // It ensures the TaskListViewModel instance is created once and stays alive.
        @StateObject private var viewModel = TaskListViewModel()
        
        var body: some View {
            NavigationView {
                VStack {
                    List(viewModel.tasks) { task in
                        NavigationLink(destination: Text("Task Details for \(task.title)")) {
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
                    }
                    Button("Add Task") {
                        viewModel.addTask(title: "New Task")
                    }
                    .accessibilityIdentifier("Add Task")
                    .padding()
                }
                .navigationTitle("Tasks")
            }
        }
    }
