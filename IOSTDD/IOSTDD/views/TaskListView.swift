import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.tasks) { task in
                        NavigationLink(destination: Text("Task Details for \(task.title)")) {
                            HStack {
                                Text(task.title)
                                Spacer()
                                Button {
                                    Task { await viewModel.removeTask(id: task.id) }
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .accessibilityIdentifier("Delete Task")
                                .buttonStyle(.borderless)
                            }
                        }
                    }
                }

                Button("Add Task") {
                    Task { await viewModel.addTask(title: "New Task") }
                }
                .accessibilityIdentifier("Add Task")
                .padding()
            }
            .navigationTitle("Tasks")
        }
        .task { await viewModel.loadTasks() }
    }
}
