import Foundation

@MainActor
final class TaskListViewModel: ObservableObject {
    @Published private(set) var tasks: [TodoItem] = []
    
    private let service: TaskService

    /// Now takes any async-capable service; defaults to your FakeRepository wrapped in a TaskService.
    init(service: TaskService = TaskService(repository: FakeRepository())) {
        self.service = service
    }

    /// Loads all tasks from the service asynchronously.
    func loadTasks() async {
        tasks = await service.fetchTasks()
    }

    /// Adds a non-empty task via the service, then refreshes the list.
    func addTask(title: String) async {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        await service.createTask(title: trimmed)
        await loadTasks()
    }

    /// Removes by ID via the service, then refreshes the list.
    func removeTask(id: UUID) async {
        await service.deleteTask(id: id)
        await loadTasks()
    }
}
