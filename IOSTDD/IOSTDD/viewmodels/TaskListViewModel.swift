import Foundation

@MainActor
final class TaskListViewModel: ObservableObject {
    @Published private(set) var tasks: [TodoItem] = []
    private let repository: RepositoryProtocol

    /// Now takes any async-capable repository; defaults to your FakeRepository.
    init(repository: RepositoryProtocol = FakeRepository()) {
        self.repository = repository
    }

    /// Loads all tasks from the repository asynchronously.
    func loadTasks() async {
        tasks = await repository.fetchTasks()
    }

    /// Adds a non-empty task and refreshes the list.
    func addTask(title: String) async {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        let newTask = TodoItem(title: trimmed)
        await repository.addTask(newTask)
        await loadTasks()
    }

    /// Removes by ID and refreshes the list.
    func removeTask(id: UUID) async {
        await repository.removeTask(by: id)
        await loadTasks()
    }
}
