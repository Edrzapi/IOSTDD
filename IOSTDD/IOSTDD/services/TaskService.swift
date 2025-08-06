import Foundation

/// A service that encapsulates task-creation, deletion, and fetching logic.
actor TaskService {
    private let repository: RepositoryProtocol

    init(repository: RepositoryProtocol) {
        self.repository = repository
    }

    /// Fetches all tasks from the repository.
    func fetchTasks() async -> [TodoItem] {
        await repository.fetchTasks()
    }

    /// Creates a new task with the given title by forwarding to the repository.
    func createTask(title: String) async {
        let item = TodoItem(title: title)
        await repository.addTask(item)
    }

    /// Deletes the task with the specified identifier by forwarding to the repository.
    func deleteTask(id: UUID) async {
        await repository.removeTask(by: id)
    }
}
