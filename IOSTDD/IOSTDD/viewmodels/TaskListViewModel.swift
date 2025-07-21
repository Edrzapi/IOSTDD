import Foundation

@MainActor
final class TaskListViewModel: ObservableObject {
    @Published private(set) var tasks: [Task] = []
    private let repository: RepositoryProtocol

    init(repository: RepositoryProtocol = FakeRepository()) {
        self.repository = repository
        self.tasks = repository.fetchTasks()
    }
    
    func addTask(title: String) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        
        let newTask = Task(title: trimmed)
        tasks.append(newTask)
        
        if let repo = repository as? FakeRepository {
            repo.addTask(newTask)
        }
    }
    
    func removeTask(id: UUID) {
        tasks.removeAll { $0.id == id }
        
        if let repo = repository as? FakeRepository {
            repo.removeTask(by: id)
        }
    }
}
